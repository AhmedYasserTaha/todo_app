import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/auth/create_account_screen.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var email = TextEditingController();
  var password = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pDarkColor,
      appBar: AppBar(
        backgroundColor: AppColors.pDarkColor,
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formkey,
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
                  validator: (Text) {
                    if (Text == null || Text.isEmpty) {
                      return "Enter Email !";
                    }
                  },
                  controller: email,
                  hintText: "Enter Email",
                  tilte: "Email",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormFieldWidget(
                  validator: (Text) {
                    if (Text == null || Text.isEmpty) {
                      return "Enter password !";
                    }
                  },
                  controller: password,
                  hintText: "Enter Password",
                  tilte: "Password",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 60,
                ),
                ButtomLogin(
                    onPressed: () async {
                      await createAccount().timeout(
                        Duration(milliseconds: 500),
                        onTimeout: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EmptyScreen(),
                          ));
                        },
                      );
                    },
                    title: "LOGIN"),
                const Gap(30),
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
                            builder: (context) => CreateAccountScreen(),
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
        ),
      ),
    );
  }

  Future<void> createAccount() async {
    if (formkey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
