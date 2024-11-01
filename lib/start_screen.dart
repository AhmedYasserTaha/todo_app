import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/home/create_account_screen.dart';
import 'package:todo_app/home/login_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        appBar: AppBar(
          backgroundColor: AppColors.pDarkColor,
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
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
                const SizedBox(
                  height: 26,
                ),
                Text(
                  "Please login to your account or create\nnew account to continue",
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      color: const Color.fromARGB(164, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                ButtomLogin(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  },
                  title: "LOGIN",
                ),
                const SizedBox(
                  height: 30,
                ),
                BouttomCreateAccount(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ));
                    },
                    textBouttom: 'CREATE ACCOUNT'),
                const SizedBox(
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
