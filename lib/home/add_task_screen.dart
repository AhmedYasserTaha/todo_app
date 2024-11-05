import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController datePicker = TextEditingController();
  TextEditingController starttimePicker = TextEditingController();
  TextEditingController endtimePicker = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const List<int> colorCode = [
      0xffFF4666,
      0xff66CC41,
      0xff41CCA7,
      0xff4181CC,
      0xffCC8441,
      0xff9741CC
    ];
    int activeColor = 0xffFF4666;
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                icon: const Icon(
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
                      icon: const Icon(
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
                      icon: const Icon(
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
            ),
            const Gap(20),
            Text(
              "Color",
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            const Gap(20),
            SizedBox(
              height: 80,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          activeColor = colorCode[index];
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Color(colorCode[index]),
                                  shape: BoxShape.circle,
                                  border: activeColor == colorCode[index]
                                      ? Border.all(
                                          color: Colors.white, width: 2)
                                      : null),
                            ),
                            activeColor == colorCode[index]
                                ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                  separatorBuilder: (context, index) => Gap(15),
                  itemCount: colorCode.length),
            ),
            const Spacer(),
            ButtomLogin(onPressed: () {}, title: "Create Task"),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
