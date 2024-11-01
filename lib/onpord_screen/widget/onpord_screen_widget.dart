import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/app_colors.dart';

class OnpordScreenWidget extends StatelessWidget {
  const OnpordScreenWidget(
      {super.key, required this.onPressed, required this.tilte});
  final void Function()? onPressed;
  final String tilte;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.only(top: 14, left: 24),
          child: Container(
            alignment: Alignment.topLeft,
            child: Text(
              tilte,
              style: TextStyle(
                  color: const Color.fromARGB(120, 255, 255, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ));
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(name);
  }
}

class TextCenter extends StatelessWidget {
  const TextCenter({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.lato(
          fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
    );
  }
}

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
        textAlign: TextAlign.center,
        title,
        style: GoogleFonts.lato(
            fontSize: 16, color: const Color.fromARGB(213, 255, 255, 255)));
  }
}

class BouttomNext extends StatelessWidget {
  const BouttomNext({
    super.key,
    required this.onPressed,
    required,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 50,
      decoration: BoxDecoration(
          color: AppColors.pSocundColor,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
          )),
    );
  }
}

class BouttomBack extends StatelessWidget {
  const BouttomBack({
    super.key,
    required this.onPressed,
  });
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 62, left: 24),
      child: TextButton(
          onPressed: onPressed,
          child: const Text(
            "BACK",
            style: TextStyle(
                color: Color.fromARGB(164, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.w400),
          )),
    );
  }
}
