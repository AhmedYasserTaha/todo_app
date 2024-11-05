import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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

  String formattedDate = DateFormat('MMMM, dd, yyyy').format(
    DateTime.now(),
  );

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.pDarkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.pDarkColor,
        title: Text(
          formattedDate,
          style: GoogleFonts.lato(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
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
            Image.asset(
              "assets/images/background_hs.png",
              height: siz.height * .40,
              width: siz.width * 80,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
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
      lastDate: DateTime.now().add(Duration(days: 30)),
      showTimelineHeader: false,
      physics: BouncingScrollPhysics(),
      activeColor: Color(0xff242969),
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
