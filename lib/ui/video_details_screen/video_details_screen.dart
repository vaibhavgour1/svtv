import 'dart:collection';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:readmore/readmore.dart';
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
  TextEditingController commentsCtr = TextEditingController();
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
                          details!.userLikes = (int.parse(details!.userLikes) + 1).toString();
                        }
                        if (state is GetVideoCommentsState) {
                          commentsList = state.commentList;
                        }
                        if (state is AddCommentsState) {
                          commentsCtr.clear();
                          getVideo(widget.videoId);
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
                                                InkWell(
                                                  onTap: () {
                                                    likeVideo(details!.id);
                                                  },
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/like-icon.png",
                                                        width: 18,
                                                        height: 18,
                                                        color: details!.userLikes == "1" ? Colors.blue : Colors.grey,
                                                      ),
                                                      const SizedBox(
                                                        height: 6,
                                                      ),
                                                      Text(
                                                        "${details!.likes} Like",
                                                        style: const TextStyle(
                                                            fontSize: 12, color: AppColor.textBodyColor),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    share(details!.link);
                                                  },
                                                  child: Column(
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
                                          child: ReadMoreText(
                                            details!.description,
                                            trimLines: 2,
                                            colorClickableText: AppColor.textBodyColor,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: '  Show more',
                                            trimExpandedText: '  Show less',
                                            style: TextStyle(fontSize: 14, color: AppColor.textBodyColor),
                                            moreStyle: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.textBodyColor,
                                                fontWeight: FontWeight.w500),
                                            lessStyle: TextStyle(
                                                fontSize: 14,
                                                color: AppColor.textBodyColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              commentsList != null ? "${commentsList!.length} Comments" : "Comments",
                                              style: TextStyle(
                                                  color: AppColor.textHeadingColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Image.asset(
                                              "assets/images/Asset 2_4x.png",
                                              height: 14,
                                              width: 14,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 14,
                                        ),
                                        child: SizedBox(
                                          height: 40,
                                          child: TextFormField(
                                            controller: commentsCtr,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: AppColor.textHeadingColor),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.only(bottom: 10, top: 8, left: 8),
                                                prefixText: " ",
                                                hintText: "Add a comment...",
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    if (commentsCtr.text.isNotEmpty) {
                                                      addComments(widget.videoId, commentsCtr.text);
                                                    }
                                                  },
                                                  icon: Icon(
                                                    Icons.send_rounded,
                                                    color: AppColor.colorPrimary,
                                                  ),
                                                ),
                                                hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                fillColor: Colors.grey.shade100,
                                                filled: true,
                                                focusedBorder: InputBorder.none,
                                                border: InputBorder.none,
                                                enabledBorder: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 14,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 14),
                                        child: commentsList != null
                                            ? ListView.separated(
                                                itemCount: commentsList!.length,
                                                shrinkWrap: true,
                                                physics: const NeverScrollableScrollPhysics(),
                                                itemBuilder: (context, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 4),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(100),
                                                              child: CachedNetworkImage(
                                                                imageUrl: commentsList![index].profileImage,
                                                                imageBuilder: (context, imageProvider) => Image(
                                                                  height: 26,
                                                                  width: 26,
                                                                  fit: BoxFit.cover,
                                                                  image: imageProvider,
                                                                ),
                                                                errorWidget: (context, url, error) => Image.asset(
                                                                  "assets/images/profile-img-bg.png",
                                                                  height: 26,
                                                                  width: 26,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Text(
                                                              commentsList![index].comment,
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(color: Colors.grey, fontSize: 13),
                                                            )
                                                          ],
                                                        ),
                                                        Text(
                                                          commentsList![index].commentDate,
                                                          style: TextStyle(color: Colors.grey, fontSize: 11),
                                                        )
                                                      ],
                                                    ),
                                                  );
                                                },
                                                separatorBuilder: (BuildContext context, int index) {
                                                  return const Divider(
                                                    color: Colors.grey,
                                                  );
                                                },
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

  void addComments(String id, String comment) {
    Map<String, dynamic> input = HashMap();
    input['video_id'] = id;
    input['comment'] = comment;
    videoDetailsBloc.add(AddVideoCommentsEvent(input: input));
  }

  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Stride Vision', text: 'Share the video link -', linkUrl: url, chooserTitle: 'Stride Vision');
  }
}
