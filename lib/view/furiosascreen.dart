import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
                            image: DecorationImage(
                                image: AssetImage("images/f.jpg"),
                                fit: BoxFit.cover)),
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
                              "Furiosa: A Mad Max Saga",
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: height * 0.02),
                            Text(
                              "Released - 2024 - 149 min",
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
                              "Snatched from the Green Place of Many Mothers, young Furiosa falls into the hand of a greatbiker horde led by the warlord Dementus. Sweeping through the Wasteland,they come across the Citadel, presided over by the Immortan Joe. As the two tyrants fight for domin Furiosa soon finds herself in a nonstop battle to make her way home.",
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
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            height: height * 0.15,
                            width: width * 0.3,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/wa.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),
                          Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/sting.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),
                          Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/une.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),
                          Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/violant.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                shape: BoxShape.circle),
                          ),
                          Container(
                            height: height * 0.15,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/winnie.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                shape: BoxShape.circle),
                          )
                        ],
                      ),
                    ),
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
                Container(
                  height: height * 0.3,
                  width: width,
                  decoration: const BoxDecoration(
                      // color: Colors.black87,
                      ),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            height: height * 0.28,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/wa.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(width * 0.06)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "aaaaa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            height: height * 0.28,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/wa.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(width * 0.06)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "aaaaa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            height: height * 0.28,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/violant.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(width * 0.06)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "aaaaa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            height: height * 0.28,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/une.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(width * 0.06)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "aaaaa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Container(
                            height: height * 0.28,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/sting.jpg"),
                                    fit: BoxFit.cover),
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.circular(width * 0.06)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "aaaaa",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: width * 0.04),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
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
