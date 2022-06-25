import 'package:flutter/material.dart';
import 'package:flutter_3_job_app/consts.dart';
import 'package:flutter_3_job_app/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int _selectedIndex = 0;

  final List<dynamic> _listMenu = [
    ["assets/icons/home_icon.png", "Home", const HomeScreen()],
    ["assets/icons/notification_icon.png", "Notif", const HomeScreen()],
    ["assets/icons/love_icon.png", "Like", const HomeScreen()],
    ["assets/icons/user_icon.png", "Profile", const HomeScreen()],
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _listMenu[_selectedIndex][2]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: thirdColor,
        unselectedItemColor: fourthColor,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _listMenu.map((index) {
          return BottomNavigationBarItem(
            backgroundColor: primaryColor,
            icon: ImageIcon(
              AssetImage(index[0]),
              size: 24,
            ),
            label: index[1],
          );
        }).toList(),
      ),
    );
  }
}
