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
  const AddMovie({super.key});

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController release = TextEditingController();
  final imagepicker = ImagePicker();
  List<XFile> image = [];
  List<String> imageUrls = [];
  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            const Center(
              child: Text(
                "AddMovie",
                style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: height * 0.02,
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
            // Description
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
            // Release
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

            // Image Container
            Container(
              height: height * 0.2,
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(20)),
              child: GridView.builder(
                itemCount: image.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Container(
                        height: height * 0.1,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(File(image[index].path)),
                                fit: BoxFit.cover),
                            border: Border.all(color: Colors.amber, width: 1)),
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
            // Pick image from gallery
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.07,
              width: width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    _getFromGallery();
                  },
                  child: const Center(
                      child: Text(
                    "MOVIE IMAGE",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.07,
              width: width * 0.9,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  onPressed: () {
                    _saveData();
                  },
                  child: const Center(
                      child: Text(
                    "SAVE DATA",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))),
            ),
          ],
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    final List<XFile>? pickedFile = await imagepicker.pickMultiImage();
    if (pickedFile != null && pickedFile.isNotEmpty) {
      setState(() {
        image.addAll(pickedFile);
      });
    } else {
      print('select image');
    }
  }

  /// Post image on Firebase
  Future<String?> postImage(XFile imagefile) async {
    try {
      Reference ref =
          FirebaseStorage.instance.ref().child('/image').child(imagefile.name);

      if (kIsWeb) {
        await ref.putData(
            await imagefile.readAsBytes(),
            SettableMetadata(
              contentType: "image/jpeg",
            ));
      } else {
        UploadTask uploadTask = ref.putFile(File(imagefile.path));
        await uploadTask;
      }

      String downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
  }

  uploadImage() async {
    for (var images in image) {
      String? downloadUrl = await postImage(images);
      if (downloadUrl != null) {
        imageUrls.add(downloadUrl);
      }
    }
  }

  /// Save product on Firebase
  _saveData() async {
    try {
      await uploadImage();
      String id = Uuid().v4();
      AddMovieModel addMovieModel = AddMovieModel(
        id: id,
        name: name.text,
        description: description.text,
        release: release.text,
        imageUrls: imageUrls,
      );
      await firebaseFirestore
          .collection('movie')
          .doc(id)
          .set(addMovieModel.toMap());
      Fluttertoast.showToast(
        msg: "Movie Add Successfully",
        backgroundColor: Colors.green,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
      clearField();
      setState(() {
        image.clear();
        imageUrls.clear();
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: Colors.red,
        fontSize: 16.0,
        gravity: ToastGravity.CENTER,
        textColor: Colors.white,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  /// Clear fields
  clearField() {
    name.clear();
    description.clear();
    release.clear();
  }
}
