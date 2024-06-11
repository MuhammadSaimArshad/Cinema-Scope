import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:whealchair_guideness/controller/user_signup_controller.dart';
import 'package:whealchair_guideness/view/login_signup/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var height, width;

  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(UserSignupController());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return GetBuilder<UserSignupController>(builder: (obj) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.8,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/wheel.png"))),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: width * 0.01,
                        ),
                      ),
                      label: Text(
                        " Name",
                        style: TextStyle(
                            color: const Color(0xff00BCD4),
                            fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: const Color(0xff00BCD4),
                        size: width * 0.05,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Your  Name';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: obj.email,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: const Color(0xff00BCD4),
                              width: width * 0.01)),
                      label: Text(
                        "Email Address",
                        style: TextStyle(
                            color: const Color(0xff00BCD4),
                            fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: const Color(0xff00BCD4),
                        size: width * 0.05,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    obscureText: obj.passToggle ? true : false,
                    controller: obj.password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(
                        "Enter Password",
                        style: TextStyle(
                            color: const Color(0xff00BCD4),
                            fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: const Color(0xff00BCD4),
                        size: width * 0.05,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (obj.passToggle == true) {
                            obj.passToggle = false;
                          } else {
                            obj.passToggle = true;
                          }
                          obj.update();
                        },
                        child: obj.passToggle
                            ? const Icon(
                                CupertinoIcons.eye_slash_fill,
                                color: const Color(0xff00BCD4),
                              )
                            : const Icon(
                                CupertinoIcons.eye_fill,
                                color: const Color(0xff00BCD4),
                              ),
                      ),
                    ),
                    obscuringCharacter: "*",
                    validator: (String? value) {
                      RegExp regex = RegExp(r'^(?=.*?[!@#\$&*~]).{4,}$');
                      if (value!.isEmpty) {
                        return 'Please enter Password';
                      } else {
                        if (value.length < 5) {
                          return ("Password Must be more than 5 characters");
                        } else if (!regex.hasMatch(value)) {
                          return ("Password should contain Special character or number");
                        } else {
                          return null;
                        }
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    obj.registeruser(context);
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.92,
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: width * 0.004, color: Colors.white),
                      borderRadius: BorderRadius.circular(width * 0.02),
                      color: const Color(0xff00BCD4),
                    ),
                    child: Center(
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have account ?",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff00BCD4),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff00BCD4),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
