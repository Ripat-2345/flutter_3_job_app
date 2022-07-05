import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:flutter_3_job_app/providers/auth_provider.dart';
import 'package:flutter_3_job_app/providers/category_provider.dart';
import 'package:flutter_3_job_app/providers/job_provider.dart';
import 'package:flutter_3_job_app/providers/user_provider.dart';
import 'package:flutter_3_job_app/screens/get_started_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<UserProvider>(
            create: (context) => UserProvider()),
        ChangeNotifierProvider<CategoryProvider>(
            create: (context) => CategoryProvider()),
        ChangeNotifierProvider<JobProvider>(
          create: (context) => JobProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          backgroundColor: secondaryColor,
          splash: "assets/icons/logo2.png",
          splashIconSize: 134.0,
          nextScreen: const GetStartedScreen(),
        ),
      ),
    );
  }
}
