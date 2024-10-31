import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/onpord_screen/screen_three.dart';
import 'package:todo_app/onpord_screen/screen_tow.dart';
import 'package:todo_app/utils/app_colors.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenThree(),
                  ));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 14, left: 24),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "SKIP",
                      style: TextStyle(
                          color: const Color.fromARGB(120, 255, 255, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Image.asset("assets/images/onpord_screen_1.png"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CostomIndecator(acttive: index == 0),
                SizedBox(width: 7),
                CostomIndecator(acttive: index == 1),
                SizedBox(width: 7),
                CostomIndecator(acttive: index == 2),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Manage your tasks",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              textAlign: TextAlign.center,
              "You can easily manage all of your daily\n tasks in DoMe for free",
              style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(206, 255, 255, 255)),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 261, bottom: 62),
              child: Container(
                width: 90,
                height: 50,
                decoration: BoxDecoration(
                    color: AppColors.pSocundColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ScreenTow(),
                      ));
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CostomIndecator extends StatelessWidget {
  final bool acttive;
  const CostomIndecator({super.key, required this.acttive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          color: acttive ? Colors.white : Colors.grey),
      width: 30,
      height: 5,
    );
  }
}
