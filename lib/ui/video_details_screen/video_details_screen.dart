import 'package:flutter/material.dart';
import 'package:svtvs/ui/catrgory_screen/category_screen.dart';
import 'package:svtvs/ui/update_profile/update_profile_screen.dart';
import 'package:svtvs/widgets/tringle_background.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoDetailsScreen extends StatefulWidget {
  const VideoDetailsScreen({Key? key}) : super(key: key);

  @override
  State<VideoDetailsScreen> createState() => _VideoDetailsScreenState();
}

class _VideoDetailsScreenState extends State<VideoDetailsScreen> {
  YoutubePlayerController _ytbPlayerController = YoutubePlayerController(
    initialVideoId: 'K18cpp_-gP8',
    params: YoutubePlayerParams(
      // playlist: ['nPt8bK2gbaU', 'gQDByCdjUXw'], // Defining custom playlist
      startAt: Duration(seconds: 30),
      showControls: true,
      showFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.pink.shade700,
          title: Text(
            "Details",
            style: TextStyle(fontSize: 14),
          ),
          leadingWidth: 14,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              iconSize: 15,
              padding: const EdgeInsets.only(left: 10)),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
        ),
        body: Stack(
          children: [
            ClipPath(
              clipper: TriangleBackground(),
              child: Container(
                color: Colors.pink.shade700,
              ),
            ),
            Positioned(
              child: Container(
                margin: const EdgeInsets.only(top: 14, bottom: 50, left: 14, right: 14),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: MediaQuery.of(context).size.width,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: _ytbPlayerController != null
                              ? YoutubePlayerIFrame(controller: _ytbPlayerController)
                              : Center(child: CircularProgressIndicator()),
                        ),
                      ),
                    ),
                    Expanded(child: SingleChildScrollView(
                      primary: false,
                      child: Column(children: [
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Video Title",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                                  )),
                              SizedBox(
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
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "69k views",
                                    style: TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/like-icon.png",
                                        width: 18,
                                        height: 18,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "9k views",
                                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Text(
                                        "Save",
                                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
                              "Video Description",
                              style: TextStyle(color: Colors.grey, fontSize: 13),
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
                                "Comments 131",
                                style: TextStyle(color: Colors.black, fontSize: 13),
                              ),
                              Image.asset(
                                "assets/images/view-icon.png",
                                width: 18,
                                height: 18,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: ListView.builder(itemCount: 1,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/profile-img-bg.png",
                                      height: 28,
                                      width: 28,),
                                    SizedBox(width: 10,),
                                    Text("Comments",style: TextStyle(color: Colors.grey,fontSize: 12),)],
                                ),
                              );
                            },
                          ),
                        ),
                      ],),
                    ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
