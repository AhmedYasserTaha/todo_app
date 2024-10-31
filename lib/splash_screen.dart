import 'package:flutter/material.dart';
import 'package:todo_app/onpord_screen/screen_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ScreenOne(),
      ));
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
