import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartAndEndtimer extends StatefulWidget {
  const StartAndEndtimer({super.key, required this.hintLabelText});
  final String hintLabelText;

  @override
  State<StartAndEndtimer> createState() => _StartAndEndtimerState();
}

class _StartAndEndtimerState extends State<StartAndEndtimer> {
  TextEditingController starttimePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 180,
      child: TextFormField(
        controller: starttimePicker,
        style: GoogleFonts.lato(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          labelText: widget.hintLabelText,
          labelStyle: const TextStyle(fontSize: 18, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: const Icon(
            Icons.timer,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        onTap: () async {
          var time = await showTimePicker(
              context: context, initialTime: TimeOfDay.now());

          if (time != null) {
            setState(() {
              starttimePicker.text = time.format(context);
            });
          }
        },
      ),
    );
  }
}
