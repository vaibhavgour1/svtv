import 'package:flutter/material.dart';
import 'package:svtvs/ui/category_dashboard/category_dashboard.dart';
import 'package:svtvs/ui/video_details_screen/video_details_screen.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  bool featured = true;
  bool live = false;
  bool replays = false;
  bool clips = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: Colors.pink.shade700,
            title: Text(
              "Category List",
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
                      context, MaterialPageRoute(builder: (context) => const CategoryDashBoard()));
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
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  margin: const EdgeInsets.only(left: 14, right: 14),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  featured = !featured;
                                  live = false;
                                  replays = false;
                                  clips = false;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(right: 10,top: 10,bottom: 10),
                                  child: Center(
                                    child: Text(
                                      "FEATURED",
                                      style: TextStyle(
                                          color: featured ? Colors.pink : Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )),
                            InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  featured = false;
                                  live = !live;
                                  replays = false;
                                  clips = false;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "LIVE",
                                      style: TextStyle(
                                          color: live ? Colors.pink : Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )),
                            InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  featured = false;
                                  live = false;
                                  replays = !replays;
                                  clips = false;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Center(
                                    child: Text(
                                      "REPLAYS",
                                      style: TextStyle(
                                          color: replays ? Colors.pink : Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )),
                            InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  featured = false;
                                  live = false;
                                  replays = false;
                                  clips = !clips;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                                  child: Center(
                                    child: Text(
                                      "CLIPS",
                                      style: TextStyle(
                                          color: clips ? Colors.pink : Colors.grey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const VideoDetailsScreen()));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 12),
                                height: MediaQuery.of(context).size.height * 0.30,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/banner-category.jpg",
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.07,
                                        color: Colors.pink.shade800,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 6, bottom: 10, left: 10, right: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Video Title",
                                                    style:
                                                        TextStyle(fontSize: 13, color: Colors.white),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/view-icon.png",
                                                        width: 18,
                                                        height: 18,
                                                        color: Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        "69k views",
                                                        style: TextStyle(
                                                            fontSize: 12, color: Colors.white),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "Video Subtitle",
                                                    style:
                                                        TextStyle(fontSize: 13, color: Colors.white),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          "assets/images/youtube-icon.png",
                                          height: 40,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
