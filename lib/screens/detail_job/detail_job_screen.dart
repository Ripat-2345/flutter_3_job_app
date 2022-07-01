import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:flutter_3_job_app/models/job_model.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailJobScreen extends StatefulWidget {
  final JobModel job;
  DetailJobScreen(this.job);

  @override
  State<DetailJobScreen> createState() => _DetailJobScreenState();
}

class _DetailJobScreenState extends State<DetailJobScreen> {
  bool isApply = false;

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
                  (isApply == true)
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 9,
                            horizontal: 25,
                          ),
                          width: 312,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xffECEDF1),
                          ),
                          child: Flexible(
                            child: Text(
                              "You have applied this job and the recruiter will contact you",
                              style: GoogleFonts.poppins(
                                color: const Color(0xffA2A6B4),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.network(
                    widget.job.companyLogo,
                    width: 60,
                    height: 60,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.job.category,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff272C2F),
                    ),
                  ),
                  Text(
                    "${widget.job.companyName} • ${widget.job.location}",
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB3B5C4),
                    ),
                  ),
                  ContentDetail(
                    title: "About the job",
                    content: widget.job.about,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentDetail(
                    title: "Qualifications",
                    content: widget.job.qualifications,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ContentDetail(
                    title: "Responsibilities",
                    content: widget.job.responsibilities,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isApply = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: (isApply == true)
                              ? Colors.redAccent
                              : secondaryColor,
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
  final List content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
