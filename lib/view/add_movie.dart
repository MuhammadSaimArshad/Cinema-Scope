import 'package:flutter/material.dart';
import 'package:whealchair_guideness/view/add_movie_screen.dart';
import 'package:whealchair_guideness/view/add_top_cast_screen.dart';

class AddMovieMain extends StatefulWidget {
  const AddMovieMain({super.key});

  @override
  State<AddMovieMain> createState() => _AddMovieMainState();
}

class _AddMovieMainState extends State<AddMovieMain> {
  var width, height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            const Center(
              child: Text(
                "Add Movie Detail",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            SizedBox(
              height: height * 0.4,
            ),
            SizedBox(
              height: height * 0.07,
              width: width * 0.94,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddMovie(),
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    "MOVIE Detail",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            SizedBox(
              height: height * 0.07,
              width: width * 0.94,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddTopCast(),
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    "Top Cast",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ))),
            ),
          ],
        ),
      ),
    );
  }
}
