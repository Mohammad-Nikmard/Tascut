import 'package:flutter/material.dart';
import 'package:note_design/ui/calendar_screen.dart';
import 'package:note_design/ui/home_screen.dart';
import 'package:note_design/ui/setting_secreen.dart';
import 'package:note_design/ui/time_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/icon_setting.png'),
            label: "تنظیمات",
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/icon_time.png'),
            label: "زمان",
            activeIcon: Image.asset(
              "assets/images/icon_time_active.png",
              height: 25,
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/icon_calendar.png'),
            label: "تقویم",
            activeIcon: Image.asset(
              "assets/images/icon_calendar_active.png",
              height: 25,
              width: 25,
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/icon_home.png',
              height: 25,
              width: 25,
            ),
            label: "خانه",
            activeIcon: Image.asset(
              "assets/images/icon_home_active.png",
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: const [
          SettingScreen(),
          TimeScreen(),
          CalendarScreen(),
          HomeScreen(),
        ],
      ),
    );
  }
}
