import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  var height, width;
  // @override
  // void initState() {
  //   Get.put(AdminProfileController());
  //   AdminProfileController.to.initalizedata();
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: height * 0.01,
                // ),
                Container(
                  height: height * 0.07,
                  color: Colors.white,
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: width * 0.05,
                          color: Color(0xff00BCD4),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                      Text(
                        "Edit Profile ",
                        style: TextStyle(
                            color: const Color(0xff00BCD4),
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.03,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.25,
                  width: width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      // Align(
                      //   alignment: Alignment.center,
                      //   child: obj.hpickedFile != null
                      //       ? Container(
                      //           height: height * 0.13,
                      //           width: width * 0.2,
                      //           decoration: BoxDecoration(
                      //               shape: BoxShape.circle,
                      //               image: DecorationImage(
                      //                   image: FileImage(
                      //                       File(obj.hpickedFile!.path)),
                      //                   fit: BoxFit.fill)),
                      //         )
                      //       : CircleAvatar(
                      //           radius: width * 0.16,
                      //           backgroundImage:
                      //               NetworkImage(obj.image.toString()),
                      //         ),
                      // ),

                      Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.15, left: width * 0.55),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const ListTile(
                                      title: Text("Profile photo"),
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.grey[300],
                                        child: Icon(
                                          Icons.add_a_photo,
                                          color: const Color(0xff00BCD4),
                                          size: width * 0.05,
                                        ),
                                      ),
                                      title: const Text("Camera"),
                                      onTap: () {
                                        // obj.pickImage(ImageSource.camera);
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.grey.shade300,
                                        child: Icon(
                                          Icons.photo,
                                          color: const Color(0xff00BCD4),
                                          size: width * 0.05,
                                        ),
                                      ),
                                      title: const Text("Gallery"),
                                      onTap: () {
                                        // obj.pickImage(ImageSource.gallery);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color(0xff00BCD4),
                            child: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Align(
                      //     alignment: Alignment.bottomCenter,
                      //     child: Text(
                      //       obj.name.text,
                      //       style: TextStyle(
                      //           fontSize: width * 0.05,
                      //           fontWeight: FontWeight.bold),
                      //     ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),

                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    // controller: obj.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        " Name",
                        style: TextStyle(
                          color: Color(0xff00BCD4),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Color(0xff00BCD4),
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
                  height: height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    // controller: obj.email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text(
                        "Email Address",
                        style: TextStyle(
                          color: Color(0xff00BCD4),
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color(0xff00BCD4),
                      ),
                    ),
                    // validator: (String? value) {
                    //   if (value!.isEmpty) {
                    //     return 'Please enter your E-mail';
                    //   } else if (EmailValidator.validate(obj.email.text) ==
                    //       false) {
                    //     return 'Please Enter Correct E-mail';
                    //   }
                    //   return null;
                    // },
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
                      border: OutlineInputBorder(),
                      label: const Text(
                        "Enter Password",
                        style: TextStyle(
                          color: Color(0xff00BCD4),
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Color(0xff00BCD4),
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
                      //       ? const Icon(CupertinoIcons.eye_slash_fill)
                      //       : const Icon(CupertinoIcons.eye_fill),
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
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    // obj.updateprofile();
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.93,
                    decoration: BoxDecoration(
                        color: Color(0xff00BCD4),
                        borderRadius: BorderRadius.circular(width * 0.03)),
                    child: Center(
                      child: Text(
                        "UpDate ",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
