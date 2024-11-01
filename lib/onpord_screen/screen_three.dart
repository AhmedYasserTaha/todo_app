import 'package:flutter/material.dart';
import 'package:todo_app/onpord_screen/widget/onpord_screen_widget.dart';
import 'package:todo_app/start_screen.dart';
import 'package:todo_app/utils/app_colors.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        body: Column(
          children: [
            const SizedBox(
              height: 54,
            ),
            const ImageScreen(name: "assets/images/onpord_screen_3.png"),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CostomIndecator(acttive: index == 2),
                SizedBox(width: 7),
                CostomIndecator(acttive: index == 1),
                SizedBox(width: 7),
                CostomIndecator(acttive: index == 0),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const TextCenter(title: "Organaize your tasks"),
            const SizedBox(
              height: 40,
            ),
            SmallText(
                title:
                    "You can organize your daily tasks by\n adding your tasks into separate categories"),
            const Spacer(),
            Row(
              children: [
                BouttomBack(onPressed: () {
                  Navigator.of(context).pop();
                }),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 62, right: 24),
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color: AppColors.pSocundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StartScreen(),
                          ));
                        },
                        child: const Text(
                          "Get Started",
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
