import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:flutter_3_job_app/screens/auth/login_screen.dart';
import 'package:flutter_3_job_app/screens/auth/register_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Build Your Next\nFuture Career Like\na Master",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  color: whiteColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "18,000 jobs available",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  color: whiteColor,
                ),
              ),
              const Spacer(),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterScreen();
                              },
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: whiteColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginScreen();
                              },
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: whiteColor,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Text(
                          "Sign In",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    )
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
