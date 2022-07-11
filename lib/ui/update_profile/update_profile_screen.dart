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
        leadingWidth: 14,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            iconSize: 15,
            padding: const EdgeInsets.only(left: 10)),
        actions: [
          InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.only(right: 14),
                child: Image.asset(
                  "assets/images/humburger-icon-white.png",
                  fit: BoxFit.contain,
                  width: 20,
                  height: 20,
                ),
              ))
        ],
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
              margin: const EdgeInsets.only(top: 14, bottom: 50, left: 12, right: 12),
              decoration:
                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
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
                          height: 60,
                        ),
                        // Username
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/user.png",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "Himanshu Sharma",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),
                        // Email
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/mail.png",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "himanshu@gmail.com",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),

                        //Phone
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/phone.png",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "+91 1234567890",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),

                        //Age
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/user.png",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "25",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),

                        //Settings
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    "assets/images/settings.png",
                                    height: 18,
                                    width: 18,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(color: Colors.grey, fontSize: 12),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 12),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),

                        //Password
                        Padding(
                          padding: const EdgeInsets.only(left: 14, right: 14, top: 18, bottom: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/password.png",
                                height: 18,
                                width: 18,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "************",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 1,
                          color: Colors.grey,
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onLongPress: () {
                            SharedPref.clearSharedPreference(context);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                                ModalRoute.withName('/'));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            height: 45,
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
                          child: Stack(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(width: 8, color: Colors.white),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade500,
                                            blurRadius: 4.0,
                                            spreadRadius: 1.0),
                                      ],
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: "",
                                      imageBuilder: (context, imageProvider) => Image(
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.contain,
                                        image: imageProvider,
                                      ),
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Image.asset(
                                        "assets/images/profile-img-bg.png",
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 20,
                                  right: 0,
                                  left: 100,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.green.shade900,
                                      size: 30,
                                    ),
                                  )),
                            ],
                          )),
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
