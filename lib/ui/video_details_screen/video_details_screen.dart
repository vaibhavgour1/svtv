import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/ui/catrgory_screen/category_screen.dart';
import 'package:svtvs/ui/update_profile/update_profile_screen.dart';
import 'package:svtvs/ui/video_details_screen/bloc/video_details_bloc.dart';
import 'package:svtvs/ui/video_details_screen/bloc/video_details_event.dart';
import 'package:svtvs/ui/video_details_screen/bloc/video_details_state.dart';
import 'package:svtvs/ui/video_details_screen/response/video_comments_response.dart';
import 'package:svtvs/ui/video_details_screen/response/video_details_response.dart';
import 'package:svtvs/utility/colors.dart';
import 'package:svtvs/widgets/tringle_background.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDetailsScreen extends StatefulWidget {
  String videoId;

  VideoDetailsScreen({required this.videoId, Key? key}) : super(key: key);

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  TextEditingController searchCtr = TextEditingController();
  VideoDetailsBloc videoDetailsBloc = VideoDetailsBloc();
  VideoDetails? details;
  List<VideoCommentList>? commentsList;

  YoutubePlayerController? _ytbPlayerController;

  @override
  void initState() {
    getVideo(widget.videoId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => videoDetailsBloc,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 8,
            centerTitle: false,
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.colorPrimary,
            title: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: const [
                  Icon(Icons.arrow_back_ios_new_rounded, size: 15),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Details",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  child: Image.asset(
                    "assets/images/humburger-icon-white.png",
                    fit: BoxFit.contain,
                    width: 20,
                    height: 20,
                  ),
                ),
              )
            ],
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                color: Colors.white,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 14),
                  child: TextFormField(
                    controller: searchCtr,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hintText: "Search Here...",
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 20,
                      ),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                        borderSide: const BorderSide(color: Colors.blue, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3), borderSide: BorderSide(color: Colors.grey, width: 1)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              ClipPath(
                clipper: TriangleBackground(),
                child: Container(
                  color: AppColor.colorPrimary,
                ),
              ),
              Positioned(
                child: Container(
                    margin: const EdgeInsets.only(top: 14, bottom: 50, left: 14, right: 14),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                    child: BlocBuilder<VideoDetailsBloc, VideoDetailsState>(
                      builder: (context, state) {
                        if (state is VideoDetailsLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: AppColor.colorPrimary,
                            ),
                          );
                        }
                        if (state is VideoDetailsFailureState) {
                          return Center(
                            child: Text(state.message),
                          );
                        }
                        if (state is GetVideoDetailsState) {
                          details = state.details;
                          getComments(details!.id);
                        }
                        if (state is GetVideoLikeState) {
                          details!.userLikes = "1";
                        }
                        if (state is GetVideoCommentsState) {
                          commentsList = state.commentList;
                        }
                        if (details != null) {
                          String url = details!.link;
                          url = url.replaceAll("https://www.youtube.com/watch?v=", "");
                          url = url.replaceAll("https://m.youtube.com/watch?v=", "");
                          _ytbPlayerController = YoutubePlayerController(
                            initialVideoId: url,
                            params: const YoutubePlayerParams(
                              startAt: Duration(seconds: 0),
                              showControls: true,
                              showFullscreenButton: true,
                            ),
                          );

                          return Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.26,
                                width: MediaQuery.of(context).size.width,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: _ytbPlayerController != null
                                      ? YoutubePlayerIFrame(
                                          controller: _ytbPlayerController,
                                        )
                                      : const Center(
                                          child: CircularProgressIndicator(
                                          color: AppColor.colorPrimary,
                                        )),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  primary: false,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14),
                                        child: Column(
                                          children: [
                                            Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  details!.title,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      color: AppColor.textHeadingColor,
                                                      fontWeight: FontWeight.w400),
                                                )),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  "assets/images/view-icon.png",
                                                  width: 18,
                                                  height: 18,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "69k views",
                                                  style: TextStyle(fontSize: 12, color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 18,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        likeVideo(details!.id);
                                                      },
                                                      child: Image.asset(
                                                        "assets/images/like-icon.png",
                                                        width: 18,
                                                        height: 18,
                                                        color: details!.userLikes == "1" ? Colors.blue : Colors.grey,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "${details!.likes} Like",
                                                      style:
                                                          const TextStyle(fontSize: 12, color: AppColor.textBodyColor),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/share-icon.png",
                                                      width: 18,
                                                      height: 18,
                                                      color: Colors.grey,
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "Share",
                                                      style: TextStyle(fontSize: 12, color: AppColor.textBodyColor),
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    Image.asset(
                                                      "assets/images/save-icon.png",
                                                      width: 18,
                                                      height: 18,
                                                      color: Colors.grey,
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "Bookmark",
                                                      style: TextStyle(fontSize: 12, color: AppColor.textBodyColor),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 28,
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            details!.description,
                                            style: TextStyle(color: AppColor.textBodyColor, fontSize: 13),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              commentsList != null ? "Comments ${commentsList!.length}" : "Comments",
                                              style: TextStyle(color: AppColor.textHeadingColor, fontSize: 13),
                                            ),
                                            Icon(Icons.arrow_drop_down_sharp)
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14),
                                        child: commentsList != null
                                            ? Container(
                                                child: ListView.builder(
                                                  itemCount: commentsList!.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                            "assets/images/profile-img-bg.png",
                                                            height: 28,
                                                            width: 28,
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            commentsList![index].comment,
                                                            style: TextStyle(color: Colors.grey, fontSize: 12),
                                                          )
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            : Container(),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }
                        return Container();
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getVideo(String videoId) {
    Map<String, dynamic> input = HashMap();
    input['video_id'] = videoId;
    videoDetailsBloc.add(GetVideoDetailsEvent(input: input));
  }

  void likeVideo(String id) {
    Map<String, dynamic> input = HashMap();
    input['video_id'] = id;
    videoDetailsBloc.add(LikeVideoEvent(input: input));
  }

  void getComments(String id) {
    Map<String, dynamic> input = HashMap();
    input['video_id'] = id;
    videoDetailsBloc.add(GetVideoCommentsEvent(input: input));
  }
}
