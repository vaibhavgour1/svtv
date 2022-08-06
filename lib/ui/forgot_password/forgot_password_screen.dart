import 'dart:collection';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_event.dart';
import 'package:svtvs/ui/forgot_password/bloc/forgot_password_state.dart';
import 'package:svtvs/ui/login_screen/login_screen.dart';
import 'package:svtvs/ui/signup_screen/signup_screen.dart';
import 'package:svtvs/utility/colors.dart';
import 'package:svtvs/widgets/tringle_background.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  ForgotPasswordBloc forgotPasswordBloc = ForgotPasswordBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => forgotPasswordBloc,
      child: SafeArea(
          child: Scaffold(
        body: Stack(
          children: [
            ClipPath(
              clipper: TriangleBackground(),
              child: Container(
                color: AppColor.colorPrimary,
              ),
            ),
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(top: 14, bottom: 40, left: 14, right: 14),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/banner-category.jpg",
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 120,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Enter your username",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(3),
                              borderSide: const BorderSide(color: Colors.grey, width: 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                                borderSide: BorderSide(color: Colors.grey, width: 1)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state is ForgotPasswordSuccessState) {
                            Fluttertoast.showToast(msg: state.message);

                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false);
                          }
                          if (state is ForgotPasswordFailureState) {
                            Fluttertoast.showToast(msg: state.message);
                          }
                        },
                        builder: (context, state) {
                          if (state is ForgotPasswordLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return InkWell(
                            onTap: () {
                              if (emailController.text.isEmpty) {
                                Fluttertoast.showToast(msg: "Username is required");
                              } else if (!EmailValidator.validate(emailController.text)) {
                                Fluttertoast.showToast(msg: "Enter valid username");
                              } else {
                                Map<String, dynamic> input = HashMap();
                                input['email'] = emailController.text;

                                forgotPasswordBloc.add(ForgotUserPasswordEvent(input: input));
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 18),
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppColor.buttonColor,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          );
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
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                              child: Text(
                                "Sign In",
                                style: TextStyle(color: AppColor.colorPrimary, fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.grey, fontSize: 12),
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
