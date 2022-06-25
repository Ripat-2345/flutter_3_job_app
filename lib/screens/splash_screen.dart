import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomNav()),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/icons/logo.png",
              width: 59,
              height: 78,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "JOB APP",
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
