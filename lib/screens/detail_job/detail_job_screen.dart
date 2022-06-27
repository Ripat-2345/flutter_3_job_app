import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailJobScreen extends StatelessWidget {
  const DetailJobScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/google-icon.png",
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Front-End Developer",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff272C2F),
                    ),
                  ),
                  Text(
                    "Google, Inc • Jakarta",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB3B5C4),
                    ),
                  ),
                  ContentDetail(title: "About the job", content: const [
                    "Full-Time On Site",
                    "Start at \$18,000 per month"
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentDetail(title: "Qualifications", content: const [
                    "Candidate must possess at least a Bachelor's Degree.",
                    "Able to use Microsoft Office and Google based service.",
                    "Have an excellent time management, good at organized and details",
                  ]),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentDetail(title: "Responsibilities", content: const [
                    "Initiate and promote any programs, events, training, or activities.",
                    "Assessing and anticipating needs and collaborate with Division.",
                  ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: secondaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          "Apply for Job",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Message Recruiter",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xffB3B5C4),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContentDetail extends StatelessWidget {
  ContentDetail({
    required this.title,
    required this.content,
  });
  final String title;
  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "About the job",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              color: const Color(0xff272C2F),
            ),
          ),
          Column(
            children: content.map((data) {
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/dot.png",
                      width: 12,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Flexible(
                      child: Text(
                        data,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff272C2F),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
