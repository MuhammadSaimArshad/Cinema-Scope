import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
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
  int PageChanged = 0;
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
                    builder: (context) => AddMovie(),
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
              Container(
                height: height * 0.43,
                width: width,
                decoration: const BoxDecoration(
                    // color: Colors.black87,
                    ),
                child: CarouselSlider(
                  items: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FuriosaScreen(),
                            ));
                      },
                      child: Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/100.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.06)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FuriosaScreen(),
                            ));
                      },
                      child: Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/winnie.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.06)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FuriosaScreen(),
                            ));
                      },
                      child: Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/violant.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.06)),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/une.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.06)),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FuriosaScreen(),
                            ));
                      },
                      child: Container(
                        width: width * 0.6,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/sting.jpg"),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(width * 0.06)),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: height * 0.4,
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
                    enlargeFactor: 0.1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        PageChanged = index;
                      });
                      print(PageChanged);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
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
                                  image: AssetImage("images/winnie.jpg"),
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
                    "Sea All",
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
    );
  }
}
