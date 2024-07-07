import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:whealchair_guideness/model/add_movie_model.dart';

class AddMovie extends StatefulWidget {
  // const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController release = TextEditingController();

  String uuid = Uuid().v4();
  final imagepicker = ImagePicker();
  List<XFile> image = [];
  List<String> imageUrls = [];
  var width;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.05, vertical: height * 0.03),
          child: Column(
            children: [
              Center(
                child: Text(
                  "AddMovie",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
              Column(
                children: [
                  //  name
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffFF9800),
                            width: width * 0.01,
                          ),
                        ),
                        label: Text(
                          "Name",
                          style: TextStyle(
                              color: const Color(0xffFF9800),
                              fontSize: width * 0.035),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  // description
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: description,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffFF9800),
                            width: width * 0.01,
                          ),
                        ),
                        label: Text(
                          "Description",
                          style: TextStyle(
                              color: const Color(0xffFF9800),
                              fontSize: width * 0.035),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Description';
                        }
                        return null;
                      },
                    ),
                  ),
                  // release
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: TextFormField(
                      controller: release,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffFF9800),
                            width: width * 0.01,
                          ),
                        ),
                        label: Text(
                          "Release",
                          style: TextStyle(
                              color: const Color(0xffFF9800),
                              fontSize: width * 0.035),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Release';
                        }
                        return null;
                      },
                    ),
                  ),

                  Container(
                    height: height * 0.2,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                    child: GridView.builder(
                      itemCount: image.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.amber, width: 1)),
                              child: Image.network(
                                File(image[index].path).path,
                                height: 100,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    image.removeAt(index);
                                  });
                                },
                                icon: Icon(Icons.cancel))
                          ],
                        );
                      },
                    ),
                  ),
                  //      // pick image from gallary
                  //      //
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.07,
                    width: width * 0.9,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: width * 0.05,
                          //     vertical: height * 0.03)
                        ),
                        onPressed: () {
                          _getFromGallery();
                        },
                        child: Center(
                            child: Text(
                          " MOVIE IMAGE",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ))),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.2,
              ),
              SizedBox(
                height: height * 0.07,
                width: width * 0.9,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      // padding: EdgeInsets.symmetric(
                      //     horizontal: width * 0.05, vertical: height * 0.03)
                    ),
                    onPressed: () {
                      _saveData();
                    },
                    child: Center(
                        child: Text(
                      "SAVE DATA",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    final List<XFile> pickedFile = await imagepicker.pickMultiImage();
    // getImage(
    //   source: ImageSource.gallery,
    //   maxWidth: 1800,
    //   maxHeight: 1800,
    // );
    if (pickedFile != null) {
      setState(() {
        image.addAll(pickedFile);
      });
    } else {
      print('select image');
    }
  }

  /// post image on firebase
  Future postImage(XFile? imagefile) async {
    String urls;
    //   await Permission.photos.request();
    Reference ref =
        FirebaseStorage.instance.ref().child('/image').child(imagefile!.name);

    if (kIsWeb) {
      await ref.putData(
          await imagefile.readAsBytes(),
          SettableMetadata(
            contentType: "image/jpeg",
          ));
      urls = await ref.getDownloadURL();
      return urls;
    }
  }

  uploadImage() async {
    for (var images in image) {
      await postImage(images).then((downloadUrl) => imageUrls.add(downloadUrl));
    }
  }

// save product on firebase

  _saveData() async {
    try {
      await uploadImage();
      var uuid;
      AddMovieModel addMovieModel = AddMovieModel(
        id: uuid,
        name: name.text,
        description: description.text,
        release: release.text,
        imageUrls: imageUrls,
      );
      await firebaseFirestore
          .collection('movie')
          .doc(uuid)
          .set(addMovieModel.toMap());
      Fluttertoast.showToast(
        msg: "Product Add Successfully",
        backgroundColor: Colors.green,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
      // Future.delayed(Duration(seconds: 10),(){
      clearfield();
      setState(() {
        image.clear();
        imageUrls.clear();
      });

      //});
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.green,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

// clear field

  clearfield() {
    name.clear();
    description.clear();

    release.clear();
  }
}
