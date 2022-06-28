import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../consts.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({required this.jobs});
  final List<dynamic> jobs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 30,
              ),
              width: double.infinity,
              height: 270,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/category.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Website Developer",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: whiteColor,
                    ),
                  ),
                  Text(
                    "12,309 available",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 30,
                right: 24,
                bottom: 16,
              ),
              child: Text(
                "Big Companies",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xff272C2F),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                children: jobs.map((data) {
                  return JobItem(
                      icons: data[0], title: data[1], company: data[2]);
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 30,
                right: 24,
                bottom: 16,
              ),
              child: Text(
                "New Startups",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xff272C2F),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
              ),
              child: Column(
                children: jobs.map((data) {
                  return JobItem(
                      icons: data[0], title: data[1], company: data[2]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class JobItem extends StatelessWidget {
  JobItem({
    required this.icons,
    required this.title,
    required this.company,
  });

  final String icons;
  final String title;
  final String company;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 312,
      height: 75,
      child: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Image.asset(
              icons,
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
                  title,
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
                  company,
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
    );
  }
}
