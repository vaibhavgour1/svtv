import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_bloc.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_event.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_state.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController phoneCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  TextEditingController confPassCtr = TextEditingController();
  TextEditingController countryCtr = TextEditingController();
  TextEditingController stateCtr = TextEditingController();
  TextEditingController cityCtr = TextEditingController();
  TextEditingController ageGroupCtr = TextEditingController();
  SignupBloc signupBloc = SignupBloc();
  RegExp emailRegExp =
      RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{1,8})$");
  RegExp passRegExp =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp mobileRegExp = RegExp(r'(^[0-9]*$)');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signupBloc,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            ClipPath(
              clipper: TriangleBackground(),
              child: Container(
                color: Colors.pink.shade700,
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 14, bottom: 40, left: 12, right: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA07FAdZnyW6xwesWiTlbqSQQ6r2I637EL9w&usqp=CAU",
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.18,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: nameCtr,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Full Name",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: phoneCtr,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Phone Number",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: emailCtr,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Email Address",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: passCtr,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: confPassCtr,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Confirm Password",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(
                                  color: Colors.blue, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextFormField(
                                controller: countryCtr,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Country",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextFormField(
                                controller: stateCtr,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "State/Province",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextFormField(
                                controller: cityCtr,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "City Name",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextFormField(
                                controller: ageGroupCtr,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "Age Group",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(3),
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 1)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<SignupBloc, SignupState>(
                        builder: (context, state) {
                          if (state is SignupLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (state is SignupSuccessState) {}
                          if (state is SignupFailureState) {}
                          return InkWell(
                              onTap: () {
                                if (nameCtr.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter name");
                                } else if (emailCtr.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter address");
                                } else if (emailRegExp
                                    .hasMatch(emailCtr.text)) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter valid email address");
                                } else if (phoneCtr.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter mobile number");
                                } else if (mobileRegExp
                                    .hasMatch(phoneCtr.text)) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter valid mobile number");
                                } else if (passCtr.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter password");
                                } else if (passCtr.text.length < 8) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Password should be contains 8 characters");
                                } else if (passRegExp.hasMatch(passCtr.text)) {
                                  Fluttertoast.showToast(
                                      msg: "Password must contain at least 1 "
                                          "lowercase latte, 1 uppercase latter, 1 digit, "
                                          "1 Special character");
                                } else if (countryCtr.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter confirm password");
                                } else if (confPassCtr.text.length < 8) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Confirm password should be contains 8 characters");
                                } else if (passRegExp.hasMatch(passCtr.text)) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Confirm password must contain at least 1 "
                                          "lowercase latte, 1 uppercase latter, 1 digit, "
                                          "1 Special character");
                                } else {
                                  Map<String, dynamic> input = HashMap();
                                  input['name'] = nameCtr.text;
                                  input['email'] = emailCtr.text;
                                  input['mobile'] = phoneCtr.text;
                                  input['password'] = confPassCtr.text;

                                  signupBloc.add(UserSignupEvent(input: input));
                                }
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ));
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot password?",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                              child: Text(
                                "Signin",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
