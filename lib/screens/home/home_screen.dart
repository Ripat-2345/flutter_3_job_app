import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<dynamic> categories = [
    [
      "assets/images/bg1.png",
      "Website Developer",
    ],
    [
      "assets/images/bg2.png",
      "Mobile Developer",
    ],
    [
      "assets/images/bg3.png",
      "App Designer",
    ],
    [
      "assets/images/bg4.png",
      "Content Writer",
    ],
    [
      "assets/images/bg5.png",
      "Video Grapher",
    ],
  ];

  final List<dynamic> posteds = [
    [
      "assets/icons/google-icon.png",
      "Front-end Developer",
      "Google",
    ],
    [
      "assets/icons/instagram.png",
      "UI Designer",
      "Instagram",
    ],
    [
      "assets/icons/facebook.png",
      "Data Scientist",
      "Facebook",
    ],
    [
      "assets/icons/facebook.png",
      "React Developer",
      "Facebook",
    ],
    [
      "assets/icons/facebook.png",
      "React Native Developer",
      "Facebook",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Howdy",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: const Color(0xffB3B5C4),
                        ),
                      ),
                      Text(
                        "Jason Powell",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff272C2F),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 58,
                    height: 58,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: primaryColor, width: 1.0),
                    ),
                    child: Image.asset("assets/images/profilePic.png"),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Hot Categories",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xff272C2F),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.map((data) {
                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 16),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        alignment: Alignment.bottomCenter,
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(data[0]),
                          ),
                        ),
                        child: Text(
                          data[1],
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Just Posted",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xff272C2F),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              for (var i = 0; i < posteds.length; i++)
                SizedBox(
                  width: 312,
                  height: 75,
                  child: Row(
                    children: [
                      Image.asset(
                        posteds[i][0],
                        width: 45,
                        height: 45,
                      ),
                      const SizedBox(
                        width: 27,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            posteds[i][1],
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff272C2F),
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            posteds[i][2],
                            style: GoogleFonts.poppins(
                              color: const Color(0xffB3B5C4),
                            ),
                          ),
                        ],
                      ),
                      const Divider(color: Color(0xffB3B5C4), thickness: 1.0),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
