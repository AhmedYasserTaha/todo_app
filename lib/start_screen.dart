import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/auth/create_account_screen.dart';
import 'package:todo_app/auth/login_screen.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pDarkColor,
        appBar: AppBar(
          backgroundColor: AppColors.pDarkColor,
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 70, horizontal: 20.0), // المسافات الجانبية
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // العنوان "Welcome to UpTodo"
                Text(
                  "Welcome to UpTodo",
                  style: GoogleFonts.lato(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center, // جعل النص في المنتصف
                ),
                const SizedBox(height: 20), // مسافة بين العنوان والنص التالي

                // الوصف "Please login to your account"
                Text(
                  "Please login to your account or create\nnew account to continue",
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: const Color.fromARGB(164, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40), // زيادة المسافة هنا

                // استخدام Spacer لضبط توزيع الأزرار
                const Spacer(),

                // زر تسجيل الدخول
                ButtomLogin(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  title: "LOGIN",
                ),

                const SizedBox(height: 20), // مسافة بين الأزرار

                // زر إنشاء حساب جديد
                BouttomCreateAccount(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen(),
                      ),
                    );
                  },
                  textBouttom: 'CREATE ACCOUNT',
                ),

                // const Gap(70), // مسافة من أسفل الصفحة
              ],
            ),
          ),
        ),
      ),
    );
  }
}
