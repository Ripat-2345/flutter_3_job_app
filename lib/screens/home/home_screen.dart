import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:flutter_3_job_app/models/category_model.dart';
import 'package:flutter_3_job_app/models/job_model.dart';
import 'package:flutter_3_job_app/providers/category_provider.dart';
import 'package:flutter_3_job_app/providers/job_provider.dart';
import 'package:flutter_3_job_app/screens/category/category_screen.dart';
import 'package:flutter_3_job_app/screens/detail_job/detail_job_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    var userProvider = Provider.of<UserProvider>(context);
    var categoryProvider = Provider.of<CategoryProvider>(context);
    var jobProvider = Provider.of<JobProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                          userProvider.user.name,
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
                FutureBuilder<List<CategoryModel>?>(
                  future: categoryProvider.getCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: snapshot.data!.map((data) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CategoryScreen(
                                        jobs: posteds,
                                      );
                                    },
                                  ),
                                );
                              },
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
                                    image: NetworkImage(data.imageUrl),
                                  ),
                                ),
                                child: Text(
                                  data.name,
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
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
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
                FutureBuilder<List<JobModel>?>(
                  future: jobProvider.getJobs(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        children: snapshot.data!.map((job) {
                          return SizedBox(
                            width: 312,
                            height: 75,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const DetailJobScreen();
                                    },
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  Image.network(
                                    job.companyLogo,
                                    width: 45,
                                    height: 45,
                                  ),
                                  const SizedBox(
                                    width: 27,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        job.companyName,
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
                                        job.name,
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xffB3B5C4),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Color(0xffB3B5C4),
                                    thickness: 1.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
