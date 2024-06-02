import 'package:flutter/material.dart';
import 'package:whealchair_guideness/view/edit_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00BCD4),
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ));
              },
              icon: const Icon(Icons.person_outline))
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Column(
          children: [
            SizedBox(
              height: height * 0.1,
            ),
            Container(
              height: height * 0.2,
              width: width * 0.8,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("images/wheel.png"))),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height * 0.2,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xff00BCD4), width: width * 0.005),
                      borderRadius: BorderRadius.circular(width * 0.02),
                      image: DecorationImage(
                          image: AssetImage("images/resturnt.png"))),
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xff00BCD4), width: width * 0.005),
                      borderRadius: BorderRadius.circular(width * 0.02),
                      image: DecorationImage(
                          image: AssetImage("images/hospital.png"))),
                ),
                Container(
                  height: height * 0.2,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          color: const Color(0xff00BCD4), width: width * 0.005),
                      borderRadius: BorderRadius.circular(width * 0.02),
                      image: DecorationImage(
                          image: AssetImage("images/toilet.png"))),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.07,
              width: width * 0.95,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: const Color(0xff00BCD4), width: width * 0.005),
                  borderRadius: BorderRadius.circular(width * 0.02)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Add Location",
                    style: TextStyle(
                        color: const Color(0xff00BCD4),
                        fontSize: width * 0.035),
                  ),
                  SizedBox(
                    width: width * 0.4,
                  ),
                  Icon(
                    Icons.add_location_rounded,
                    color: const Color(0xff00BCD4),
                    size: width * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
