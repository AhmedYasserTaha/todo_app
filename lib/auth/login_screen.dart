// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/auth/create_account_screen.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_dialog.dart';
import 'package:todo_app/utils/app_shared_pref.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();

  var password = TextEditingController();

  var formkey = GlobalKey<FormState>();
  bool pass = true;
  Icon iconsPass = const Icon(
    Icons.visibility_off_outlined,
    size: 30,
    color: Colors.white,
  );

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
                  abstract: const Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter Password",
                  style: GoogleFonts.lato(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (Text) {
                    if (Text == null || Text.isEmpty) {
                      return "Enter Password !";
                    }
                  },
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  obscureText: pass,
                  controller: password,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          pass = !pass;
                          if (pass == false) {
                            iconsPass = const Icon(
                              Icons.visibility_outlined,
                              size: 30,
                              color: Colors.white,
                            );
                          } else {
                            iconsPass = const Icon(
                              Icons.visibility_off_outlined,
                              size: 30,
                              color: Colors.white,
                            );
                          }
                        });
                      },
                      icon: iconsPass,
                    ),
                    hintText: "Password",
                    hintStyle: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: AppColors.pSocundColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                ButtomLogin(
                    onPressed: () async {
                      await login().timeout(
                        const Duration(milliseconds: 500),
                        onTimeout: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EmptyScreen(),
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
        ),
      ),
    );
  }

  Future<void> login() async {
    if (!formkey.currentState!.validate()) {
      return; // لا تنفذ إذا لم تكن المدخلات صالحة
    }
    AppDialog.showLoding(context: context);
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      AppSharedPref.saveData(key: "Token", value: auth.currentUser!.uid);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const EmptyScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.of(context).pop(); // أغلق نافذة التحميل
      if (e.code == 'user-not-found') {
        AppDialog.showError(
            content: "No user found for that email.", context: context);
      } else if (e.code == 'wrong-password') {
        AppDialog.showError(
            content: "Wrong password provided for that user.",
            context: context);
      } else {
        AppDialog.showError(content: e.message!, context: context);
      }
    } catch (e) {
      Navigator.of(context).pop(); // أغلق نافذة التحميل
      AppDialog.showError(
          content: "An unexpected error occurred. Please try again.",
          context: context);
    }
  }
}
