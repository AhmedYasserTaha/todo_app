import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/onpord_screen/widget/onpord_screen_widget.dart';
import 'package:todo_app/start_screen.dart';
import 'package:todo_app/utils/app_colors.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  int index = 0;
  final PageController _pageController = PageController();
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.page != 2) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      index = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        body: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.15),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: const [
                    OnboardingPage(
                      image: "assets/images/onpord_screen_1.png",
                      title: "Manage your tasks",
                      description:
                          "You can easily manage all of your daily\n tasks in DoMe for free",
                    ),
                    OnboardingPage(
                      image: "assets/images/onpord_screen_2.png",
                      title: "Organize your day",
                      description:
                          "Keep track of your tasks and stay on top of your goals.",
                    ),
                    OnboardingPage(
                      image: "assets/images/onpord_screen_3.png",
                      title: "Achieve more",
                      description:
                          "With DoMe, you can stay focused and get more done.",
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    3,
                    (i) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: CustomIndicator(active: index == i),
                        )),
              ),
              Gap(screenHeight * 0.07),
              SizedBox(
                width: screenWidth * 0.4,
                height: screenHeight * 0.06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.pSocundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const StartScreen()),
                    );
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Gap(screenHeight * 0.07)
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ImageScreen(name: image),
        SizedBox(height: screenHeight * 0.02),
        TextCenter(title: title),
        SizedBox(height: screenHeight * 0.05),
        SmallText(title: description),
      ],
    );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool active;
  const CustomIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56),
        color: active ? Colors.white : Colors.grey,
      ),
      width: active ? 30 : 15,
      height: 5,
    );
  }
}
