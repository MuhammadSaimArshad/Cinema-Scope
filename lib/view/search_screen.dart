import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whealchair_guideness/model/add_movie_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var height, width;
  TextEditingController search = TextEditingController();
  String qury = "";
  void updateQuery(String q) {
    qury = q;
    searchdata(q);
  }

  List<AddMovieModel> list = [];
  List<AddMovieModel> fuilterlist = [];
//   fuilterdata(String q){
// fuilter = [];

//   }
  Future<void> searchdata(String query) async {
    fuilterlist.clear();

    if (query.isEmpty && query == "") {
      fuilterlist.addAll(list);
    } else {
      query = query.toLowerCase();

      fuilterlist = list.where((item) {
        return item.name!.toLowerCase().contains(query);
      }).toList();

      // print(fuilterlist.length);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.black87,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: TextFormField(
                controller: search,
                onChanged: (value) {
                  updateQuery(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white, width: 1.0),
                    ),
                    hintText: "Search Movie",
                    hintStyle: const TextStyle(color: Colors.white70),
                    suffixIcon: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white30,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          )),
                    )),
                autocorrect: true,
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('movie')
                      .snapshots(),
                  builder: (BuildContext context1, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      print("Error: /${snapshot.error}");
                      return Text('Error: /${snapshot.error}');
                    }

                    AddMovieModel? adddmovie;
                    if (snapshot.data!.docs.length != 0) {
                      print(
                          'snapshot.data!.docs.length/${snapshot.data!.docs.length}');
                    }

                    return snapshot.data!.docs.length == 0 &&
                            snapshot.data!.docs.isEmpty
                        ? Center(
                            child: Text('Data not found !'),
                          )
                        : ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              adddmovie = AddMovieModel.fromMap(
                                  snapshot.data!.docs[index].data());
                              if (search.text.isNotEmpty) {
                                if (adddmovie!.name
                                    .toString()
                                    .toLowerCase()
                                    .contains(search.text.toString())) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: height * 0.3,
                                      width: width * 0.7,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(width * 0.05),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            blurRadius: width * 0.02,
                                            spreadRadius: width * 0.01,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height * 0.26,
                                            width: width * 0.7,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "${adddmovie!.imageUrls![0]}",
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
                                            "${adddmovie!.name}",
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
                                } else {
                                  return Container(
                                    color: Colors.white,
                                  );
                                }
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: height * 0.3,
                                    width: width * 0.7,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(width * 0.05),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: width * 0.02,
                                          spreadRadius: width * 0.01,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: height * 0.26,
                                          width: width * 0.7,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${adddmovie!.imageUrls![0]}",
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
                                          "${adddmovie!.name}",
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
                              }
                            },
                          );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
