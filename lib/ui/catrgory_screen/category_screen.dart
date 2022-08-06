import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:svtvs/ui/update_profile/update_profile_screen.dart';
import 'package:svtvs/ui/video_details_screen/video_details_screen.dart';
import 'package:svtvs/utility/colors.dart';
import 'package:svtvs/widgets/category_list_widget.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class CategoryListScreen extends StatefulWidget {
  int categoryId;

  CategoryListScreen({required this.categoryId, Key? key}) : super(key: key);

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> with TickerProviderStateMixin {
  TabController? tabController;
  int index = 0;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  "Category List",
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
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40, left: 14, right: 14),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TabBar(
                          controller: tabController,
                          indicatorColor: Colors.transparent,
                          unselectedLabelColor: AppColor.textHeadingColor,
                          isScrollable: false,
                          indicatorPadding: const EdgeInsets.all(0),
                          labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          onTap: (value) {
                            index = value;
                          },
                          padding: const EdgeInsets.all(0),
                          labelColor: AppColor.colorPrimary,
                          tabs: const [
                            Text(
                              "FEATURED",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Text(
                              "LIVE",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Text(
                              "REPLAYS",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Text(
                              "CLIPS",
                              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          CategoryListWidget(index: 0, categoryId: widget.categoryId),
                          CategoryListWidget(index: 1, categoryId: widget.categoryId),
                          CategoryListWidget(index: 2, categoryId: widget.categoryId),
                          CategoryListWidget(index: 3, categoryId: widget.categoryId),
                        ],
                      ),
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
