import 'dart:async';

import 'package:flutter/material.dart';
import 'package:svtvs/ui/signup_screen/signup_screen.dart';
import 'package:svtvs/utility/colors.dart';

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
navigation(){
  Future.delayed(
      Duration(seconds: 1),
          () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignupScreen())));
}
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Container(
      height: height,
      width: width,
      color: AppColor.colorPrimary,
    ));
  }
}
