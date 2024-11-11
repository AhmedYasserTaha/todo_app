import 'package:flutter/material.dart';
import 'package:todo_app/onpord_screen/screen_three.dart';
import 'package:todo_app/onpord_screen/screen_tow.dart';
import 'package:todo_app/onpord_screen/widget/onpord_screen_widget.dart';
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
            OnpordScreenWidget(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ScreenThree(),
                  ));
                },
                tilte: "SKIP"),
            const SizedBox(
              height: 20,
            ),
            const ImageScreen(name: "assets/images/onpord_screen_1.png"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CostomIndecator(acttive: index == 0),
                const SizedBox(width: 7),
                CostomIndecator(acttive: index == 1),
                const SizedBox(width: 7),
                CostomIndecator(acttive: index == 2),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const TextCenter(
              title: "Manage your tasks",
            ),
            const SizedBox(
              height: 40,
            ),
            const SmallText(
                title:
                    "You can easily manage all of your daily\n tasks in DoMe for free"),
            const Spacer(),
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
                        builder: (context) => const ScreenTow(),
                      ));
                    },
                    child: const Text(
                      "NEXT",
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
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(56),
          color: acttive ? Colors.white : Colors.grey),
      width: 30,
      height: 5,
    );
  }
}
