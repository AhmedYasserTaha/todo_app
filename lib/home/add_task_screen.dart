import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/firebase/firebase_database.dart';
import 'package:todo_app/data/model/app_task.dart';
import 'package:todo_app/home/empty_screen.dart';
import 'package:todo_app/home/widget/task_widget_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_dialog.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';
import 'package:intl/intl.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var datePicker = TextEditingController();
  TextEditingController starttimePicker = TextEditingController();
  TextEditingController endtimePicker = TextEditingController();
  final List<int> colorCode = [
    0xffFF4666,
    0xff66CC41,
    0xff41CCA7,
    0xff4181CC,
    0xffCC8441,
    0xff9741CC
  ];
  var formkey = GlobalKey<FormState>();
  var tilte = TextEditingController();
  var note = TextEditingController();
  DateTime time = DateTime.now();
  int activeColor = 0xffFF4666;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: AppColors.pDarkColor,
        title: Text(
          "Add Task",
          style: GoogleFonts.lato(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: AppColors.pDarkColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                TextFormFieldWidget(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Enter Title !";
                    }
                  },
                  controller: tilte,
                  hintText: " Enter title here",
                  tilte: "Title",
                  obscureText: false,
                  abstract: const Icon(
                    Icons.title,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const Gap(25),
                TextFormFieldWidget(
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Enter Note !";
                    }
                  },
                  controller: note,
                  hintText: " Enter note here",
                  tilte: "Note",
                  obscureText: false,
                  abstract: const Icon(
                    Icons.note,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                const Gap(25),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Date",
                    style: GoogleFonts.lato(fontSize: 18, color: Colors.grey),
                  ),
                ),
                const Gap(10),
                dateFromeHistory(context),
                const Gap(50),
                const Row(
                  children: [
                    StartAndEndtimer(hintLabelText: "Start Time"),
                    Gap(20),
                    StartAndEndtimer(hintLabelText: "End Time"),
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
                                          ? Border.all()
                                          : null),
                                ),
                                activeColor == colorCode[index]
                                    ? const Icon(
                                        Icons.check,
                                        color: Color.fromARGB(255, 255, 123, 0),
                                      )
                                    : const SizedBox(),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => const Gap(15),
                      itemCount: colorCode.length),
                ),
                const Gap(30),
                ButtomLogin(
                    onPressed: () async {
                      await addTaskToFirebase();
                    },
                    title: "Create Task"),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addTaskToFirebase() async {
    if (formkey.currentState!.validate()) {
      AppDialog.showLoding(context: context);
      try {
        AppTask task = AppTask(
            title: tilte.text,
            description: note.text,
            dateTime: time,
            color: activeColor);
        await FirebaseDatabase.addTask(task);
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => EmptyScreen(),
          ),
          (route) => false,
        );
      } catch (e) {
        Navigator.of(context).pop();

        AppDialog.showError(content: e.toString(), context: context);
      }
    }
  }

  TextFormField dateFromeHistory(BuildContext context) {
    return TextFormField(
      controller: datePicker,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
          hintText: "Pick a crunnt Date",
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
          suffixIcon: const Icon(
            Icons.date_range_outlined,
            size: 30,
            color: Color.fromARGB(255, 255, 255, 255),
          )),
      onTap: () async {
        DateTime? datetime = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2030));

        if (datetime != null) {
          String formattedDate = DateFormat('dd,MMMM,yyyy').format(datetime);

          setState(() {
            time = datetime;
            datePicker.text = formattedDate;
          });
        }
      },
    );
  }
}
