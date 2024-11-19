import 'package:flutter/material.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/onpord_screen/screen_one.dart';
import 'package:todo_app/start_screen.dart';
import 'package:todo_app/utils/app_shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    var token = AppSharedPref.getData(key: "Token");
    Future.delayed(const Duration(seconds: 4), () {
      // ignore: use_build_context_synchronously
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => token == null || token == ""
              ? const ScreenOne()
              : const EmptyScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      "assets/images/splash_screen.png",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.fill,
    ));
  }
}
