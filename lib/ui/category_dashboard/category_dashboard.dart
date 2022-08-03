import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/ui/category_dashboard/bloc/category_bloc.dart';
import 'package:svtvs/ui/category_dashboard/bloc/category_event.dart';
import 'package:svtvs/ui/category_dashboard/bloc/category_state.dart';
import 'package:svtvs/ui/category_dashboard/response/category_response.dart';
import 'package:svtvs/ui/catrgory_screen/category_screen.dart';
import 'package:svtvs/ui/update_profile/update_profile_screen.dart';
import 'package:svtvs/widgets/tringle_background.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CategoryDashBoard extends StatefulWidget {
  const CategoryDashBoard({Key? key}) : super(key: key);

  @override
  State<CategoryDashBoard> createState() => _CategoryDashBoardState();
}

class _CategoryDashBoardState extends State<CategoryDashBoard> {
  TextEditingController searchCtr = TextEditingController();
  List<CategoryList> categoryList = [];
  List<String> imageList = [
    "assets/images/atheletics-icon.png",
    "assets/images/football-icon.png",
    "assets/images/cricket-icon.png",
    "assets/images/netball-icon.png",
    "assets/images/basketball-icon.png",
    "assets/images/soccer-icon.png",
    "assets/images/atheletics-icon.png",
    "assets/images/hockey-icon.png",
    "assets/images/cycling-icon.png",
  ];

  List<String> categoryNames = [
    "Athletics",
    "Football",
    "Cricket",
    "Netball",
    "Basketball",
    "Rugby",
    "Boxing",
    "Hockey",
    "Cycling",
  ];
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.pink.shade700,
          title: Text(
            "Category",
            style: TextStyle(fontSize: 14),
          ),
          leadingWidth: 14,
          leading: IconButton(
              onPressed: () {},
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
                        borderRadius: BorderRadius.circular(3),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
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
                color: Colors.pink.shade700,
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 14, bottom: 50, left: 14, right: 14),
                decoration:
                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: MediaQuery.of(context).size.width,
                        child:  Stack(
                          children: [
                            Image.asset(
                              "assets/images/banner-category.jpg",
                              fit: BoxFit.cover,
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
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "  Popular Cateory",
                          style: TextStyle(
                              color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          itemCount: 9,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1 / 1.3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap:(){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryListScreen()));
                                  },
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width * 0.14,
                                    backgroundColor: Colors.pink.shade700,
                                    child: Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Image.asset(
                                        imageList[index],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  categoryNames[index],
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
