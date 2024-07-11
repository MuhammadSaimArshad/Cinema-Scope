import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whealchair_guideness/model/add_movie_model.dart';

class FuriosaScreen extends StatefulWidget {
  const FuriosaScreen({super.key});

  @override
  State<FuriosaScreen> createState() => _FuriosaScreenState();
}

class _FuriosaScreenState extends State<FuriosaScreen> {
  var height, width;
  Color iconColor = Colors.white;

  void _handleTap() {
    setState(() {
      iconColor = Colors.yellow;
    });
  }

  void _handleDoubleTap() {
    setState(() {
      iconColor = Colors.white;
    });
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final imagepicker = ImagePicker();
  List<XFile> image = [];

  List<AddMovieModel> movielist = [];
  getProducts() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("movie").get();
    snapshot.docs.forEach((doc) {
      setState(() {
        movielist
            .add(AddMovieModel.fromMap(doc.data() as Map<String, dynamic>));
      });
    });
    print('movielist: $movielist');
  }

  @override
  void initState() {
    // TODO: implement initState
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: SizedBox(
          height: height,
          width: width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  height: height * 0.7,
                  width: width,
                  color: Colors.green,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.7,
                        width: width,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: movielist.isNotEmpty &&
                                  movielist[0].imageUrls != null
                              ? DecorationImage(
                                  image: NetworkImage(
                                    movielist[0].imageUrls![0],
                                  ),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child:
                            movielist.isEmpty || movielist[0].imageUrls == null
                                ? const Center(
                                    child: Text(
                                      'No image available',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                : null,
                      ),
                      Container(
                        height: height * 0.7,
                        width: width,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.7,
                        width: width,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Container(
                                  width: width * 0.05,
                                  height: height * 0.03,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                          ))),
                                ),
                                SizedBox(
                                  width: width * 0.83,
                                ),
                                GestureDetector(
                                  onTap: _handleTap,
                                  onDoubleTap: _handleDoubleTap,
                                  child: FaIcon(
                                    FontAwesomeIcons.solidHeart,
                                    color: iconColor,
                                    size: 30.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.31,
                            ),
                            Text(
                              movielist[0].name!,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              movielist[0].release!,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Action . Adventure . Science Fiction",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              textAlign: TextAlign.center,
                              movielist[0].description!,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Top cast",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: width * 0.04),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.18,
                  width: width,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('movie')
                          .snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          print("Error: /${snapshot.error}");
                          return Text('Error: /${snapshot.error}');
                        }

                        AddMovieModel? Model;
                        if (snapshot.data!.docs.length != 0) {
                          print(
                              'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                        }
                        return snapshot.data!.docs.length == 0 &&
                                snapshot.data!.docs.isEmpty
                            ? const Center(
                                child: Text('Data not found !'),
                              )
                            : ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  Model = AddMovieModel.fromMap(
                                      snapshot.data!.docs[index].data());
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: height * 0.18,
                                      width: width * 0.3,
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height * 0.16,
                                            width: width * 0.3,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${Model!.imageUrls![0]}",
                                                      scale: 2),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                      }),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(
                      "Similer Movies",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: width * 0.04),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                SizedBox(
                  height: height * 0.35,
                  width: width,
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('movie')
                          .snapshots(),
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        if (snapshot.hasError) {
                          print("Error: /${snapshot.error}");
                          return Text('Error: /${snapshot.error}');
                        }

                        AddMovieModel? Model;
                        if (snapshot.data!.docs.length != 0) {
                          print(
                              'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                        }
                        return snapshot.data!.docs.length == 0 &&
                                snapshot.data!.docs.isEmpty
                            ? const Center(
                                child: Text('Data not found !'),
                              )
                            : ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  Model = AddMovieModel.fromMap(
                                      snapshot.data!.docs[index].data());
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const FuriosaScreen(), // Update this to navigate to the appropriate screen
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        width: width * 0.4,
                                        height: height * 0.35,
                                        child: Column(
                                          children: [
                                            Container(
                                              height: height * 0.28,
                                              width: width * 0.4,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          "${Model!.imageUrls![0]}",
                                                          scale: 1),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          width * 0.06)),
                                            ),
                                            SizedBox(
                                              height: height * 0.005,
                                            ),
                                            Text(
                                              "${Model!.name}",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                      }),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
