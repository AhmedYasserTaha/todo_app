import 'package:flutter/material.dart';
import 'package:todo_app/onpord_screen/screen_three.dart';
import 'package:todo_app/onpord_screen/widget/onpord_screen_widget.dart';
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
            OnpordScreenWidget(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenThree(),
                  ));
                },
                tilte: "SKIP"),
            const SizedBox(
              height: 20,
            ),
            const ImageScreen(name: "assets/images/onpord_screen_2.png"),
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
            const TextCenter(title: "Create daily routine"),
            const SizedBox(
              height: 40,
            ),
            const SmallText(
              title:
                  "In Uptodo you can create your\n personalized routine to stay productive",
            ),
            const Spacer(),
            Row(
              children: [
                BouttomBack(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 60, left: 200),
                  child: BouttomNext(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ScreenThree(),
                      ));
                    },
                    title: 'NEXT',
                  ),
                )
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
