import 'package:flutter/material.dart';
import 'package:todo_app/onpord_screen/screen_three.dart';
import 'package:todo_app/utils/app_colors.dart';

class ScreenTow extends StatefulWidget {
  const ScreenTow({super.key});

  @override
  State<ScreenTow> createState() => _ScreenTowState();
}

class _ScreenTowState extends State<ScreenTow> {
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
            const SizedBox(
              height: 20,
            ),
            Image.asset("assets/images/onpord_screen_2.png"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CostomIndecator(acttive: index == 2),
                SizedBox(width: 7),
                CostomIndecator(acttive: index == 0),
                SizedBox(width: 7),
                CostomIndecator(acttive: index == 1),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Create daily routine",
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              textAlign: TextAlign.center,
              "In Uptodo  you can create your\n personalized routine to stay productive",
              style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(206, 255, 255, 255)),
            ),
            const Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 62, left: 24),
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "BACK",
                        style: TextStyle(
                            color: const Color.fromARGB(164, 255, 255, 255),
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 62, right: 24),
                  child: Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.pSocundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenThree(),
                          ));
                        },
                        child: Text(
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
