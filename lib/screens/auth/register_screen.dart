import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/bottom_nav.dart';
import 'package:flutter_3_job_app/models/user_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../consts.dart';
import '../../providers/auth_provider.dart';
import '../../providers/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController goalController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    goalController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Colors.red,
        ),
      );
    }

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
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: const Color(0xffB3B5C4),
                  ),
                ),
                Text(
                  "Begin New Journey",
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
                  child: Container(
                    width: 103,
                    height: 103,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: primaryColor, width: 1.0),
                    ),
                    child: Image.asset("assets/images/profilePic.png"),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                FormRegister(
                  emailController: emailController,
                  passwordController: passwordController,
                  nameController: nameController,
                  goalController: goalController,
                ),
                const SizedBox(height: 40),
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () async {
                              if (emailController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  nameController.text.isEmpty ||
                                  goalController.text.isEmpty) {
                                showError("Fields Cannot Empty");
                              } else {
                                setState(() {
                                  isLoading = true;
                                });

                                UserModel? user = await authProvider.register(
                                  emailController.text,
                                  passwordController.text,
                                  nameController.text,
                                  goalController.text,
                                );

                                setState(() {
                                  isLoading = false;
                                });

                                if (user != null) {
                                  userProvider.user = user;
                                  if (!mounted) return;
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const BottomNav(),
                                    ),
                                    (route) => false,
                                  );
                                } else {
                                  showError("Email Sudah Terdaftar!");
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: primaryColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              "Sign Up",
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Back To Sign In",
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

class FormRegister extends StatelessWidget {
  FormRegister({
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.goalController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController goalController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Full Name",
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
            controller: nameController,
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
            controller: emailController,
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
            controller: passwordController,
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
          "Your Goal",
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
            controller: goalController,
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
