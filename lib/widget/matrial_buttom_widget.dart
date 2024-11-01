import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/app_colors.dart';

class ButtomLogin extends StatelessWidget {
  const ButtomLogin({super.key, required this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onPressed,
        color: AppColors.pSocundColor,
        minWidth: 370,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            title,
            style: GoogleFonts.lato(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

class BouttomCreateAccount extends StatelessWidget {
  const BouttomCreateAccount({
    super.key,
    required this.onPressed,
    required this.textBouttom,
  });
  final void Function()? onPressed;
  final String textBouttom;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.pSocundColor),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: 350,
        child: Text(
          textBouttom,
          style: GoogleFonts.lato(
              color: AppColors.ptextColor,
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.tilte,
      required this.obscureText});
  final TextEditingController controller;
  final String hintText;
  final String tilte;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tilte,
          style: GoogleFonts.lato(fontSize: 18, color: Colors.grey),
          textAlign: TextAlign.right,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.lato(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.pSocundColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
            ),
          ),
        ),
      ],
    );
  }
}
