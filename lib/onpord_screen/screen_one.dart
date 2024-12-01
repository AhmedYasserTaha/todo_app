import 'dart:async'; // لإضافة Timer
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
  // لتتبع الصفحة الحالية
  int index = 0;

  // Controller للـ PageView
  final PageController _pageController = PageController();

  // Timer للتمرير التلقائي بين الصفحات
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // بدء التمرير التلقائي بين الصفحات بعد 2 ثانية
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
    _timer.cancel(); // إيقاف التمرير التلقائي عند الخروج من الشاشة
    super.dispose();
  }

  // تغيير الصفحة عند التمرير
  void _onPageChanged(int page) {
    setState(() {
      index = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        body: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              // تم التعديل هنا لاحتواء الشاشات في PageView
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  children: const [
                    // الشاشات التي ستتم إضافتها داخل PageView
                    Column(
                      children: [
                        ImageScreen(name: "assets/images/onpord_screen_1.png"),
                        SizedBox(height: 20),
                        TextCenter(
                          title: "Manage your tasks",
                        ),
                        SizedBox(height: 40),
                        SmallText(
                            title:
                                "You can easily manage all of your daily\n tasks in DoMe for free"),
                      ],
                    ),
                    Column(
                      children: [
                        ImageScreen(name: "assets/images/onpord_screen_2.png"),
                        SizedBox(height: 20),
                        TextCenter(
                          title: "Organize your day",
                        ),
                        SizedBox(height: 40),
                        SmallText(
                            title:
                                "Keep track of your tasks and stay on top of your goals."),
                      ],
                    ),
                    Column(
                      children: [
                        ImageScreen(name: "assets/images/onpord_screen_3.png"),
                        SizedBox(height: 20),
                        TextCenter(
                          title: "Achieve more",
                        ),
                        SizedBox(height: 40),
                        SmallText(
                            title:
                                "With DoMe, you can stay focused and get more done."),
                      ],
                    ),
                  ],
                ),
              ),
              // الدوائر الصغيرة للمؤشر
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
              const Gap(50),
              SizedBox(
                width: 200, // عرض الزر
                height: 60, // ارتفاع الزر
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40), // المسافة الجانبية
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pSocundColor, // لون الخلفية
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // لتدوير الزوايا
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15), // padding داخل الزر
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const StartScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500, // سمك النص
                      ),
                    ),
                  ),
                ),
              ),

              const Gap(50)
            ],
          ),
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
