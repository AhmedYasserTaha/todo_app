import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController datePicker = TextEditingController();
  TextEditingController starttimePicker = TextEditingController();
  TextEditingController endtimePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppColors.pDarkColor,
        title: Text(
          "Add Task",
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.pDarkColor,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Gap(50),
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: " Enter title here",
              tilte: "Title",
              obscureText: false,
            ),
            Gap(25),
            TextFormFieldWidget(
              controller: TextEditingController(),
              hintText: " Enter note here",
              tilte: "Note",
              obscureText: false,
            ),
            Gap(25),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Date",
                style: GoogleFonts.lato(fontSize: 18, color: Colors.grey),
              ),
            ),
            Gap(10),
            TextFormField(
              controller: datePicker,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                hintText: "Pick a crunnt Date",
                hintStyle: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.pSocundColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                icon: Icon(
                  Icons.date_range_outlined,
                  size: 30,
                  color: AppColors.pSocundColor,
                ),
              ),
              onTap: () async {
                DateTime? datetime = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025));

                if (datetime != null) {
                  String formattedDate =
                      DateFormat('dd-MMMM-yyyy').format(datetime);

                  setState(() {
                    datePicker.text = formattedDate;
                  });
                }
              },
            ),
            const Gap(50),
            Row(
              children: [
                Container(
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
                      icon: Icon(
                        Icons.more_time_sharp,
                        size: 30,
                        color: AppColors.pSocundColor,
                      ),
                      labelText: "Start Time",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
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
                ),
                Gap(15),
                Container(
                  height: 50,
                  width: 180,
                  child: TextFormField(
                    controller: endtimePicker,
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.more_time_sharp,
                        size: 30,
                        color: AppColors.pSocundColor,
                      ),
                      labelText: "End Time",
                      labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onTap: () async {
                      var time = await showTimePicker(
                          context: context, initialTime: TimeOfDay.now());

                      if (time != null) {
                        setState(() {
                          endtimePicker.text = time.format(context);
                        });
                      }
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
