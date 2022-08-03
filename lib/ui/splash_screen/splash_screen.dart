import 'dart:async';

import 'package:flutter/material.dart';
import 'package:svtvs/ui/category_dashboard/category_dashboard.dart';
import 'package:svtvs/ui/login_screen/login_screen.dart';
import 'package:svtvs/ui/signup_screen/signup_screen.dart';
import 'package:svtvs/utility/colors.dart';
import 'package:svtvs/utility/constants.dart';
import 'package:svtvs/utility/shared_prefernce.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigation();
  }

  navigation() async {
    bool isLoggedIn =
        await SharedPref.getBooleanPreference(Constant.isLoggedIn);
    if (isLoggedIn) {
      Future.delayed(
          Duration(seconds: 1),
              () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const CategoryDashBoard()),
              (Route<dynamic> route) => false));

    } else {
      Future.delayed(
          Duration(seconds: 1),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (Route<dynamic> route) => false));
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
      height: height,
      width: width,
      color: Colors.white,
    ));
  }
}
