import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/home/create_account_screen.dart';
import 'package:todo_app/home/login_screen.dart';
import 'package:todo_app/utils/app_colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        appBar: AppBar(
          backgroundColor: AppColors.pDarkColor,
          iconTheme: IconThemeData(color: Colors.white, size: 30),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 58),
            child: Column(
              children: [
                Text(
                  "Welcome to UpTodo",
                  style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 26,
                ),
                Text(
                  "Please login to your account or create\nnew account to continue",
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      color: const Color.fromARGB(164, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
                  },
                  color: AppColors.pSocundColor,
                  minWidth: 350,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "LOGIN",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.pSocundColor),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CreateAccountScreen(),
                      ));
                    },
                    minWidth: 350,
                    child: Text(
                      "CREATE ACCOUNT",
                      style: GoogleFonts.lato(
                          color: AppColors.ptextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
