import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/bottom_nav.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../consts.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign In",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xffB3B5C4),
                  ),
                ),
                Text(
                  "Build Your Career",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff272C2F),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/work_illustration.png",
                    width: 261,
                    height: 240,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const FormLogin(),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const BottomNav();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: primaryColor,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Text(
                        "Get Started",
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterScreen();
                          },
                        ),
                      );
                    },
                    child: Text(
                      "Create New Account",
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
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email Address",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xffB3B5C4),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xffF1F0F5),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff4141A4)),
                borderRadius: BorderRadius.circular(100),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffFD4F56)),
                borderRadius: BorderRadius.circular(100),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffFD4F56)),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Password",
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: const Color(0xffB3B5C4),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color(0xffF1F0F5),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xff4141A4)),
                borderRadius: BorderRadius.circular(100),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffFD4F56)),
                borderRadius: BorderRadius.circular(100),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffFD4F56)),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
