import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:whealchair_guideness/model/add_movie_model.dart';
import 'package:whealchair_guideness/view/add_movie.dart';
import 'package:whealchair_guideness/view/add_movie_screen.dart';
import 'package:whealchair_guideness/view/furiosascreen.dart';
import 'package:whealchair_guideness/view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height, width;

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddMovieMain(),
                  ));
            },
            child: Icon(Icons.add_box_rounded)),
        title: Center(
          child: Text(
            "Movies",
            style:
                TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchScreen(),
                    ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.black87,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                    "Trending",
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
              // SizedBox(
              //   height: height * 0.3,
              //   width: width,
              //   child: StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('movie')
              //         .snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }

              //       if (snapshot.hasError) {
              //         print("Error: ${snapshot.error}");
              //         return Text('Error: ${snapshot.error}');
              //       }

              //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              //         return Center(
              //           child: Text('Data not found!'),
              //         );
              //       }

              //       List<AddMovieModel> movies = snapshot.data!.docs
              //           .map((doc) => AddMovieModel.fromMap(
              //               doc.data() as Map<String, dynamic>))
              //           .toList();

              //       return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: movies.length,
              //         itemBuilder: (context, index) {
              //           AddMovieModel model = movies[index];

              //           return Padding(
              //             padding: const EdgeInsets.all(8.0),
              //             child: Container(
              //               width: width * 0.8,
              //               decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(10),
              //                 boxShadow: [
              //                   BoxShadow(
              //                     color: Colors.black12,
              //                     blurRadius: width * 0.02,
              //                     spreadRadius: width * 0.001,
              //                   ),
              //                 ],
              //               ),
              //               child: Column(
              //                 children: [
              //                   Text(
              //                     model.name ?? "",
              //                     style: TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                       fontSize: width * 0.04,
              //                     ),
              //                   ),
              //                   SizedBox(
              //                     height: height * 0.22,
              //                     width: width,
              //                     child: CarouselSlider.builder(
              //                       options: CarouselOptions(
              //                         aspectRatio: 2,
              //                         autoPlay: true,
              //                       ),
              //                       itemCount: model.imageUrls?.length ?? 0,
              //                       itemBuilder: (context, index, realIndex) {
              //                         return Padding(
              //                           padding: const EdgeInsets.all(8.0),
              //                           child: Container(
              //                             height: height * 0.2,
              //                             width: width,
              //                             decoration: BoxDecoration(
              //                               image: DecorationImage(
              //                                 fit: BoxFit.cover,
              //                                 image: NetworkImage(
              //                                     model.imageUrls![index]),
              //                               ),
              //                             ),
              //                           ),
              //                         );
              //                       },
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              // SizedBox(
              //   height: height * 0.3,
              //   width: width,
              //   child: StreamBuilder(
              //     stream: FirebaseFirestore.instance
              //         .collection('movie')
              //         .snapshots(),
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const Center(child: CircularProgressIndicator());
              //       }

              //       if (snapshot.hasError) {
              //         print("Error: ${snapshot.error}");
              //         return Text('Error: ${snapshot.error}');
              //       }

              //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              //         return Center(
              //           child: Text('Data not found!'),
              //         );
              //       }

              //       List<AddMovieModel> movies = snapshot.data!.docs
              //           .map((doc) => AddMovieModel.fromMap(
              //               doc.data() as Map<String, dynamic>))
              //           .toList();

              //       return ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: movies.length,
              //         itemBuilder: (context, index) {
              //           AddMovieModel model = movies[index];

              //           return Column(
              //             children: [
              //               SizedBox(
              //                 height: height * 0.22,
              //                 width: width,
              //                 child: CarouselSlider.builder(
              //                   options: CarouselOptions(
              //                     aspectRatio: 2,
              //                     autoPlay: true,
              //                   ),
              //                   itemCount: movies.length ?? 0,
              //                   itemBuilder: (context, index, realIndex) {
              //                     return Padding(
              //                       padding: const EdgeInsets.all(8.0),
              //                       child: Container(
              //                         height: height * 0.2,
              //                         width: width,
              //                         decoration: BoxDecoration(
              //                           image: DecorationImage(
              //                             fit: BoxFit.cover,
              //                             image: NetworkImage(
              //                                 model.imageUrls![index]),
              //                           ),
              //                         ),
              //                       ),
              //                     );
              //                   },
              //                 ),
              //               ),
              //             ],
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              // SizedBox(
              //   height: height * 0.02,
              // ),
              SizedBox(
                height: height * 0.43,
                width: width,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('movie')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      print("Error: ${snapshot.error}");
                      return Text('Error: ${snapshot.error}');
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(
                        child: Text('Data not found!'),
                      );
                    }

                    List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

                    return CarouselSlider.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index, realIndex) {
                        var doc = documents[index];
                        var imageUrl = doc['imageUrls'][
                            0]; // Assuming each document has a list of image URLs
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FuriosaScreen(), // Update this to navigate to the appropriate screen
                              ),
                            );
                          },
                          child: Container(
                            width: width * 0.6,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(width * 0.06),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: height * 0.43,
                        aspectRatio: 18 / 9,
                        viewportFraction: 0.7,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    "Upcoming",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: width * 0.04),
                  ),
                  SizedBox(
                    width: width * 0.63,
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
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
                                );
                              },
                            );
                    }),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Text(
                    "Top Rated",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: width * 0.04),
                  ),
                  SizedBox(
                    width: width * 0.63,
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
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
    );
  }
}
