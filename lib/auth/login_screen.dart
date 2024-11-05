import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/auth/create_account_screen.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              "Login",
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
              hintText: "Enter Email",
              tilte: "Email",
              obscureText: false,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: "Enter Password",
              tilte: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 60,
            ),
            ButtomLogin(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => EmptyScreen(),
                  ));
                },
                title: "LOGIN"),
            Spacer(),
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
                        builder: (context) => const CreateAccountScreen(),
                      ));
                    },
                    child: Text(
                      "Register",
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
