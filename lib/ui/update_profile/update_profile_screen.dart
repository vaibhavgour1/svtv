import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:svtvs/ui/login_screen/login_screen.dart';
import 'package:svtvs/utility/shared_prefernce.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.pink.shade700,
        title: Text(
          "Profile",
          style: TextStyle(fontSize: 14),
        ),
        leadingWidth: 10,
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios), iconSize: 18),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
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
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.pink.shade700,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: MediaQuery.of(context).size.height * 0.18,
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          child: ListView.separated(
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              if (index == 6) {
                                return Container();
                              }
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.home),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Home"),
                                    ],
                                  ),
                                  index == 4 || index == 5
                                      ? Icon(Icons.arrow_forward_ios)
                                      : Container(),
                                ],
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 0.5,
                                color: Colors.grey,
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        InkWell(
                          onLongPress: () {
                            SharedPref.clearSharedPreference(context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()),
                                ModalRoute.withName('/'));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.11,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 8,
                                color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade500,
                                    blurRadius:4.0,
                                    spreadRadius: 1.0
                                  ),
                                ],
                              ),
                              child: CachedNetworkImage(
                                imageUrl:"",
                                imageBuilder:
                                    (context, imageProvider) => Image(
                                      height: 100,
                                      width: 100,
                                  fit: BoxFit.contain,
                                  image: imageProvider,
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Icon(
                                      Icons.person_add,
                                      color: Colors.red,
                                      size: 55,
                                    ),
                              ),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
