import 'dart:collection';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:svtvs/ui/category_dashboard/category_dashboard.dart';
import 'package:svtvs/ui/login_screen/bloc/login_bloc.dart';
import 'package:svtvs/ui/login_screen/bloc/login_event.dart';
import 'package:svtvs/ui/login_screen/bloc/login_state.dart';
import 'package:svtvs/ui/signup_screen/signup_screen.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  static RegExp emailRegex =
      RegExp(r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z])$');

  static RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  LoginBloc loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => loginBloc,
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
                    top: 14, bottom: 40, left: 14, right: 14),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://iriefm-wp-upload.s3.amazonaws.com/uploads/STRIDE-VISION-TV-LOGO.jpg",
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Enter your username",
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
                        height: 30,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: passController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Enter your password",
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
                        height: 30,
                      ),
                      BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {
                        if (state is LoginSuccessState) {
                          Fluttertoast.showToast(msg: "Login Success");

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CategoryDashBoard()),
                                  (Route<dynamic> route) => false);
                        }
                        if (state is LoginFailureState) {
                          Fluttertoast.showToast(msg: state.message);
                        }
                      }, builder: (context, state) {
                        if (state is LoginLoadingState) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return InkWell(
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Username is required");
                              } else if (!EmailValidator.validate(
                                  emailController.text)) {
                                Fluttertoast.showToast(
                                    msg: "Enter valid username");
                              } else if (passController.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Password is required");
                              }
                              // else if (!passwordRegex
                              //     .hasMatch(passController.text)) {
                              //   Fluttertoast.showToast(
                              //       msg: "Enter valid password");
                              // }
                              else {
                                Map<String, dynamic> input = HashMap();
                                input['username'] = emailController.text;
                                input['password'] = passController.text;

                                loginBloc.add(LoginUserEvent(input: input));
                              }
                            },
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue,
                              child: Center(
                                child: Text(
                                  "Signin",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ));
                      }),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen()));
                              },
                              child: Text(
                                "Forgot password?",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignupScreen()));
                              },
                              child: Text(
                                "Signup",
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
