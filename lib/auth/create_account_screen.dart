// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/data/firebase/firebase_database.dart';
import 'package:todo_app/data/model/app_users.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_dialog.dart';
import 'package:todo_app/utils/app_shared_pref.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

// ignore: must_be_immutable
class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  var name = TextEditingController();
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
                  validator: (Text) {
                    if (Text == null || Text.isEmpty) {
                      return "Enter your name !";
                    }
                  },
                  controller: name,
                  hintText: "User Name",
                  tilte: "Enter your name",
                  obscureText: false,
                  abstract: const Icon(
                    Icons.account_circle_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Enter Email !";
                    }
                  },
                  controller: email,
                  hintText: "Email",
                  tilte: "Enter your email",
                  obscureText: false,
                  abstract: const Icon(
                    Icons.email,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                  validator: (text) {
                    if (text == null || text.isEmpty) {
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
                      await createAccount();
                    },
                    title: "Create Account"),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.lato(
                          color: AppColors.pSocundColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
      AppDialog.showLoding(context: context);
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.text, password: password.text);
        AppUsers user = AppUsers(name: name.text, email: email.text);
        await FirebaseDatabase.createUser(user);
        AppSharedPref.saveData(
            key: "Token", value: FirebaseAuth.instance.currentUser!.uid);
        Navigator.of(context).pop();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const EmptyScreen(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Navigator.of(context).pop();

          AppDialog.showError(
              content: "The password provided is too weak.", context: context);
        } else if (e.code == 'email-already-in-use') {
          Navigator.of(context).pop();

          AppDialog.showError(
              content: "The account already exists for that email",
              context: context);
        }
      } catch (e) {
        Navigator.of(context).pop();
        AppDialog.showError(content: e.toString(), context: context);
      }
    }
  }
}
