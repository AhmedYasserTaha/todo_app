import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ButtomLogin extends StatelessWidget {
  ButtomLogin(
      {super.key,
      required this.onPressed,
      required this.title,
      this.color = AppColors.pSocundColor});
  final void Function()? onPressed;
  final String title;
  Color color = AppColors.pSocundColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
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
        minWidth: 370,
        child: Text(
          textBouttom,
          style: GoogleFonts.lato(
              color: AppColors.ptextColor,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

class TextFormFieldWidget extends StatelessWidget {
  TextFormFieldWidget({
    super.key,
    required this.abstract,
    required this.controller,
    required this.hintText,
    required this.tilte,
    required this.obscureText,
    required this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final String tilte;
  final bool obscureText;
  final Icon abstract;
  final String? Function(String?)? validator;

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
          validator: validator,
          obscureText: obscureText,
          controller: controller,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          maxLines: null, // لدعم النصوص متعددة الأسطر
          keyboardType: TextInputType
              .multiline, // لجعل لوحة المفاتيح تدعم النصوص المتعددة
          decoration: InputDecoration(
            suffixIcon: abstract,
            hintText: hintText,
            hintStyle: GoogleFonts.lato(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  const BorderSide(color: Colors.blue), // عدّل اللون حسب الحاجة
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
