import 'dart:collection';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:svtvs/ui/login_screen/login_screen.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_bloc.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_event.dart';
import 'package:svtvs/ui/update_profile/bloc/profile_state.dart';
import 'package:svtvs/ui/update_profile/response/profile_details_response.dart';
import 'package:svtvs/utility/colors.dart';
import 'package:svtvs/utility/shared_prefernce.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passController = TextEditingController();
  ProfileBloc profileBloc = ProfileBloc();
  XFile? imgFile;
  @override
  void initState() {
    getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => profileBloc,
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
                    "Profile",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
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
                ),
              )
            ],
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
                  margin: const EdgeInsets.only(top: 14, bottom: 50, left: 12, right: 12),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.colorPrimary,
                          ),
                        );
                      }
                      if (state is ProfileFailureState) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      if (state is GetProfileDetailsState) {
                        nameController.text = state.userInfo.name;
                        emailController.text = state.userInfo.email;
                        phoneController.text = state.userInfo.mobileNo;
                        ageController.text = state.userInfo.ageGroup;
                        passController.text = "123456";
                      }
                      if (state is ProfileDetailsUploadState) {
                        Fluttertoast.showToast(msg: state.message);
                        getProfile();
                      }
                      if (state is ProfileDetailsUploadFailureState) {
                        Fluttertoast.showToast(msg: state.message);
                      }
                      return SingleChildScrollView(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.colorPrimary,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  height: MediaQuery.of(context).size.height * 0.18,
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                //Username
                                Padding(
                                  padding: const EdgeInsets.only(left: 14, right: 14),
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
                                      Expanded(
                                        child: TextFormField(
                                          controller: nameController,
                                          style: TextStyle(color: Colors.grey, fontSize: 14),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                        ),
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
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
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
                                      Expanded(
                                        child: TextFormField(
                                          controller: emailController,
                                          style: TextStyle(color: Colors.grey, fontSize: 14),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                        ),
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
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
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
                                      Expanded(
                                        child: TextFormField(
                                          controller: phoneController,
                                          maxLength: 10,
                                          style: TextStyle(color: Colors.grey, fontSize: 14),
                                          decoration: InputDecoration(
                                            counterText: "",
                                            contentPadding: const EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                        ),
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
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
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
                                      Expanded(
                                        child: TextFormField(
                                          controller: ageController,
                                          style: TextStyle(color: Colors.grey, fontSize: 14),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),

                                //Settings
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 14,
                                        right: 14,
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          SharedPref.clearSharedPreference(context);
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                                              (Route<dynamic> route) => false);
                                        },
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              "assets/images/settings.png",
                                              height: 18,
                                              width: 18,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  enabled: false,
                                                  contentPadding: const EdgeInsets.all(0),
                                                  hintText: "Logout",
                                                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                                                  border: InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      bottom: 0,
                                      right: 10,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.grey,
                                        size: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),

                                //Password
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 14,
                                    right: 14,
                                  ),
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
                                      Expanded(
                                        child: TextFormField(
                                          controller: passController,
                                          obscureText: true,
                                          style: TextStyle(color: Colors.grey, fontSize: 14),
                                          decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.all(0),
                                            border: InputBorder.none,
                                          ),
                                        ),
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
                                  onTap: () {
                                    updateProfileDetails();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(horizontal: 18),
                                    height: 45,
                                    width: MediaQuery.of(context).size.width,
                                    color: AppColor.buttonColor,
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
                                                  color: Colors.grey.shade500, blurRadius: 4.0, spreadRadius: 1.0),
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
                                        onPressed: () {
                                          pickImage();
                                        },
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green.shade900,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image != null){
        imgFile = image;
      }
      return;
    } on PlatformException catch(e) {
      log('Failed to pick image: $e');
    }
  }

  void getProfile() {
    profileBloc.add(GetProfileDetailsEvent());
  }

  void updateProfileDetails() {
    if (nameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Full name is required");
    } else if (phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Mobile number is required");
    } else if (phoneController.text.length < 10) {
      Fluttertoast.showToast(msg: "Enter valid mobile number");
    } else if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Email is required");
    } else if (!EmailValidator.validate(emailController.text)) {
      Fluttertoast.showToast(msg: "Enter valid email");
    } else if (ageController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Age group is required");
    } else {
      Map<String, dynamic> input = HashMap();
      input['name'] = nameController.text;
      input['email_id'] = emailController.text;
      input['mobile'] = phoneController.text;
      input['age_group'] = ageController.text;
      profileBloc.add(ProfileDetailsUploadEvent(input: input));
    }
  }
}
