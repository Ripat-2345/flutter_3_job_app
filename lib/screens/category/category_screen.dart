import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/models/job_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../consts.dart';
import '../../providers/job_provider.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreen({required this.categoryJob});
  final Map<String, dynamic> categoryJob;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

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
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.categoryJob['imageUrl']),
                  fit: BoxFit.cover,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.categoryJob['name'],
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
                "Available Job",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xff272C2F),
                ),
              ),
            ),
            FutureBuilder<List<JobModel>?>(
              future: jobProvider.getJobByCategory(widget.categoryJob['name']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      children: snapshot.data!.map((data) {
                        return JobItem(
                          icons: data.companyLogo,
                          title: data.name,
                          company: data.category,
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
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 30,
                right: 24,
                bottom: 16,
              ),
              child: Text(
                "Another Available Job",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color(0xff272C2F),
                ),
              ),
            ),
            FutureBuilder<List<JobModel>?>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                    ),
                    child: Column(
                      children: snapshot.data!.map((data) {
                        return JobItem(
                          icons: data.companyLogo,
                          title: data.name,
                          company: data.category,
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
            Image.network(
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
