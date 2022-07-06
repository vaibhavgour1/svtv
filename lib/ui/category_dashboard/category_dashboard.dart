import 'package:flutter/material.dart';
import 'package:svtvs/widgets/tringle_background.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CategoryDashBoard extends StatefulWidget {
  const CategoryDashBoard({Key? key}) : super(key: key);

  @override
  State<CategoryDashBoard> createState() => _CategoryDashBoardState();
}

class _CategoryDashBoardState extends State<CategoryDashBoard> {
  TextEditingController searchCtr = TextEditingController();

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
            leadingWidth: 10,
            leading: IconButton(
                onPressed: () {}, icon: Icon(Icons.arrow_back_ios), iconSize: 18),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
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
                  margin: const EdgeInsets.only(
                      top: 14, bottom: 50, left: 12, right: 12),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox(

                              height: MediaQuery.of(context).size.height * 0.24,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: _ytbPlayerController != null
                                    ? YoutubePlayerIFrame(
                                    controller: _ytbPlayerController)
                                    : Center(child: CircularProgressIndicator()),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.10,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "  Popular Cateory",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.48,
                            child: GridView.builder(
                                padding: const EdgeInsets.symmetric(horizontal: 14),
                                itemCount: 9,
                                gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  childAspectRatio: 2 / 2.4,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 16,
                                ),
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Container(
                                          height: 94,
                                          width: 94,
                                          color: Colors.pink.shade700,
                                          child: Icon(
                                            Icons.home,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "Category",
                                        style: TextStyle(fontSize: 10),
                                      )
                                    ],
                                  );
                                }),
                          )
                        ],
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
