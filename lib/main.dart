import 'package:flutter/material.dart';
import 'package:note_design/constants/constants.dart';
import 'package:note_design/ui/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        splashColor: Colors.transparent,
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: "SM",
            fontSize: 12,
            color: MyColors.greyColor,
          ),
          titleMedium: TextStyle(
            fontFamily: "SB",
            fontSize: 16,
            color: Colors.black,
          ),
          titleSmall: TextStyle(
            fontFamily: "SB",
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
