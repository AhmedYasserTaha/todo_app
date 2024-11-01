import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/home/login_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.pDarkColor,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "Register",
              style: GoogleFonts.lato(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: "User Name",
              tilte: "Enter your name",
              obscureText: false,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: "Enter Password",
              tilte: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: "Confirm Password",
              tilte: "Confirm Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 60,
            ),
            ButtomLogin(onPressed: () {}, title: "REGISTER"),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Dont have an accont?",
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.lato(
                        color: AppColors.pSocundColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
