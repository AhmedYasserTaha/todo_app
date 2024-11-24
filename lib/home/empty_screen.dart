import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/firebase/firebase_database.dart';
import 'package:todo_app/data/model/app_users.dart';
import 'package:todo_app/home/add_task_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:intl/intl.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({super.key});

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('MMMM-dd-yyyy').format(
    DateTime.now(),
  );
  AppUsers? user;
  @override
  void initState() {
    super.initState();
    getUser();
  }

  void getUser() async {
    user = await FirebaseDatabase.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    List<int> taskList = [];
    return Scaffold(
      backgroundColor: AppColors.pDarkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.pDarkColor,
        title: Row(
          children: [
            Text(
              formattedDate,
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              user?.name ?? "",
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.ptextColor),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Gap(15),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Today",
                style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const Gap(20),
            _easyInfiniteDateTimeLineWidget(),
            const Gap(50),
            taskList.isEmpty
                ? Image.asset(
                    "assets/images/background_hs.png",
                    height: siz.height * .40,
                    width: siz.width * 80,
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    height: siz.height * .16,
                    width: siz.width * .90,
                    decoration: BoxDecoration(
                        color: const Color(0xffFF4666),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Task 1",
                              style: GoogleFonts.lato(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                const Gap(10),
                                Text(
                                  "09:33 PM - 09:48 PM",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const Gap(10),
                            Text("Learn Dart",
                                style: GoogleFonts.lato(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white))
                          ],
                        ),
                        const Spacer(),
                        Container(
                          width: 1.5,
                          height: 80,
                          color: Colors.white,
                        ),
                        const Gap(15),
                        Image.asset("assets/images/todo_icon.png"),
                        const Gap(5),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
        backgroundColor: AppColors.pSocundColor,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  EasyInfiniteDateTimeLine _easyInfiniteDateTimeLineWidget() {
    return EasyInfiniteDateTimeLine(
      firstDate: DateTime.now(),
      focusDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      showTimelineHeader: false,
      physics: const BouncingScrollPhysics(),
      activeColor: const Color(0xff242969),
      dayProps: const EasyDayProps(
        borderColor: AppColors.pDarkColor,
        inactiveDayNumStyle:
            TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
        inactiveDayStrStyle: TextStyle(
            color: Color.fromARGB(190, 255, 255, 255),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        inactiveMothStrStyle: TextStyle(
            color: Color.fromARGB(190, 255, 255, 255),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        activeDayNumStyle: TextStyle(
            color: Color.fromARGB(190, 255, 255, 255),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        activeDayStrStyle: TextStyle(
            color: Color.fromARGB(190, 255, 255, 255),
            fontSize: 16,
            fontWeight: FontWeight.w400),
        activeMothStrStyle: TextStyle(
            color: Color.fromARGB(190, 255, 255, 255),
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
      onDateChange: (selectedDate) {
        setState(() {});
      },
    );
  }
}
