import 'package:flutter/material.dart';
import 'package:whealchair_guideness/view/home_screen.dart';

import 'package:whealchair_guideness/view/login_signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var height, width;
  // @override
  // void initState() {
  //   Get.put(AdminLoginController());
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
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
                    // controller: obj.email,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
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
                    // obscureText: obj.passToggle ? true : false,
                    // controller: obj.password,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: Text(
                        "Enter Password",
                        style: TextStyle(
                            color: Color(0xff00BCD4), fontSize: width * 0.035),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Color(0xff00BCD4),
                        size: width * 0.05,
                      ),
                      // suffixIcon: InkWell(
                      //   onTap: () {
                      //     if (obj.passToggle == true) {
                      //       obj.passToggle = false;
                      //     } else {
                      //       obj.passToggle = true;
                      //     }
                      //     obj.update();
                      //   },
                      //   child: obj.passToggle
                      //       ? const Icon(
                      //           CupertinoIcons.eye_slash_fill,
                      //           color: const Color(0xff0EBE7F),
                      //         )
                      //       : const Icon(
                      //           CupertinoIcons.eye_fill,
                      //           color: const Color(0xff0EBE7F),
                      //         ),
                      // ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ));

                    // obj.signInWithEmailAndPassword2(context);
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
                        "Login",
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
                      "Don't have any account?",
                      style: TextStyle(
                        color: const Color(0xff00BCD4),
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ));
                      },
                      child: Text(
                        "SignUp",
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff00BCD4),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
