import 'dart:async';
import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svtvs/api/network.dart';
import 'package:svtvs/ui/catrgory_screen/bloc/category_list_bloc.dart';
import 'package:svtvs/ui/catrgory_screen/bloc/category_list_event.dart';
import 'package:svtvs/ui/catrgory_screen/bloc/category_list_state.dart';
import 'package:svtvs/ui/catrgory_screen/response/video_list_response.dart';
import 'package:svtvs/ui/video_details_screen/video_details_screen.dart';
import 'package:svtvs/utility/colors.dart';

class CategoryListWidget extends StatefulWidget {
  int index;
  int categoryId;

  CategoryListWidget({required this.index, required this.categoryId, Key? key}) : super(key: key);

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  CategoryListBloc categoryListBloc = CategoryListBloc();
  List<VideoDetails> videoList = [];

  @override
  void initState() {
    getVideoList(widget.index, widget.categoryId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryListBloc,
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: BlocBuilder<CategoryListBloc, CategoryListState>(
          builder: (context, state) {
            if (state is CategoryListLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColor.colorPrimary,
                ),
              );
            }
            if (state is GetCategoryListState) {
              videoList = state.videoList;
            }
            if (state is CategoryListFailureSate) {
              return Center(
                child: Text(state.message),
              );
            }
            if (videoList.isNotEmpty) {
              return ListView.builder(
                itemCount: videoList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoDetailsScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      height: MediaQuery.of(context).size.height * 0.28,
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
                              height: MediaQuery.of(context).size.height * 0.065,
                              color: AppColor.colorPrimary.withOpacity(0.9),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, bottom: 10, left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.60,
                                      child: Text(
                                        "${videoList[index].title}",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12, color: Colors.white, height: 1.5),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 2),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            "assets/images/view-icon.png",
                                            width: 16,
                                            height: 16,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            "${videoList[index].likes} views",
                                            style: TextStyle(fontSize: 11, color: Colors.white),
                                          ),
                                        ],
                                      ),
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
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  getVideoList(int index, int id) async {
    Map<String, dynamic> input = HashMap();
    input["category_id"] = id.toString();
    input["tab_type"] = index == 0
        ? "featured"
        : index == 1
            ? "live"
            : index == 2
                ? "replays"
                : index == 3
                    ? "clips"
                    : "";
    categoryListBloc.add(GetCategoryListEvent(input: input));
  }
}
