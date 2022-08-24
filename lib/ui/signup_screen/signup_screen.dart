import 'dart:collection';
import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:svtvs/ui/forgot_password/forgot_password_screen.dart';
import 'package:svtvs/ui/login_screen/login_screen.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_bloc.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_event.dart';
import 'package:svtvs/ui/signup_screen/bloc/signup_state.dart';
import 'package:svtvs/utility/colors.dart';
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
  RegExp emailRegExp = RegExp(r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{1,8})$");
  RegExp passRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  RegExp mobileRegExp = RegExp(r'(^[0-9]*$)');
  List<String> ageGroup = ['20-29', '30-39', '40-49', '50+'];
  String age = "20-29";

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
                margin: const EdgeInsets.only(top: 14, bottom: 40, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(
                        0.0,
                        -1.0,
                      ),
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 14,),
                      ClipRRect(
                        child: Image.asset(
                          "assets/images/login.jpeg",
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
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
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: phoneCtr,
                          maxLength: 10,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Phone Number",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                            counterText: "",
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
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: passCtr,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Password",
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
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        height: 45,
                        child: TextFormField(
                          controller: confPassCtr,
                          obscureText: true,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Confirm Password",
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
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: TextFormField(
                                controller: stateCtr,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  hintText: "State/Province",
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
                            Container(
                              width: MediaQuery.of(context).size.width * 0.40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 8.0, right: 20),
                                child: DropdownButton<String>(
                                  value:  age,
                                  icon: const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.grey,
                                  ),
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                                  underline: Container(),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      age = newValue!;
                                    });
                                  },
                                  items: ageGroup.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      enabled: true,
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<SignupBloc, SignupState>(
                        listener: (context, state) {
                          log("State  $state");
                          if (state is SignupSuccessState) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (Route<dynamic> route) => false);
                            Fluttertoast.showToast(msg: "Login Success");
                          }
                          if (state is SignupFailureState) {
                            print(state.message);
                          }
                        },
                        builder: (context, state) {
                          if (state is SignupLoadingState) {
                            return Center(
                              child: CircularProgressIndicator(
                                color: AppColor.colorPrimary,
                              ),
                            );
                          }
                          return InkWell(
                              onTap: () {
                                if (nameCtr.text.isEmpty) {
                                  Fluttertoast.showToast(msg: "Full name is required");
                                } else if (phoneCtr.text.isEmpty) {
                                  Fluttertoast.showToast(msg: "Mobile number is required");
                                } else if (phoneCtr.text.length < 10) {
                                  Fluttertoast.showToast(msg: "Enter valid mobile number");
                                } else if (emailCtr.text.isEmpty) {
                                  Fluttertoast.showToast(msg: "Email is required");
                                } else if (!EmailValidator.validate(emailCtr.text)) {
                                  Fluttertoast.showToast(msg: "Enter valid email");
                                } else if (passCtr.text.isEmpty) {
                                  Fluttertoast.showToast(msg: "Password is required");
                                } else if (!passRegExp.hasMatch(passCtr.text)) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Password must contain at least 1 lowercase latte, 1 uppercase latter, 1 digit, 1 Special character and it should be 8 character long");
                                } else if (confPassCtr.text.isEmpty) {
                                  Fluttertoast.showToast(msg: "Confirm password is required");
                                } else if (!passRegExp.hasMatch(confPassCtr.text)) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Confirm password must contain at least 1 lowercase latte, 1 uppercase latter, 1 digit, 1 Special character and it should be 8 character long");
                                } else if (confPassCtr.text != passCtr.text) {
                                  Fluttertoast.showToast(msg: "Password not match");
                                } else {
                                  Map<String, dynamic> input = HashMap();
                                  input['name'] = nameCtr.text;
                                  input['email'] = emailCtr.text;
                                  input['mobile'] = phoneCtr.text;
                                  input['password'] = confPassCtr.text;
                                  input['country'] = countryCtr.text;
                                  input['state'] = stateCtr.text;
                                  input['city'] = cityCtr.text;
                                  input['age_group'] = age;

                                  signupBloc.add(UserSignupEvent(input: input));
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
                        height: 24,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()));
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(color: AppColor.colorPrimary, fontSize: 12),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                              },
                              child: Text(
                                "Sign In",
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
