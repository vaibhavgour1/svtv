import 'package:flutter/material.dart';
import 'package:svtvs/widgets/tringle_background.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSA07FAdZnyW6xwesWiTlbqSQQ6r2I637EL9w&usqp=CAU",
                          fit: BoxFit.cover,
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
                                borderSide:
                                const BorderSide(color: Colors.blue, width: 1),
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
                                borderSide:
                                const BorderSide(color: Colors.blue, width: 1),
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
                        InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 18),
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
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPasswordScreen()));
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(color: Colors.blue, fontSize: 12),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignupScreen()));
                                },
                                child: Text(
                                  "Signup",
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
        ));
  }
}
