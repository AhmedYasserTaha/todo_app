import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/model/app_task.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({super.key, required this.siz, required this.task});

  final Size siz;
  final AppTask task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: siz.height * .16,
      width: siz.width * .90,
      decoration: BoxDecoration(
          color: Color(task.color), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
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
                    DateFormat("dd-MM-yyyy").format(task.dateTime),
                    style: GoogleFonts.lato(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const Gap(10),
              Text(task.description,
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
    );
  }
}
