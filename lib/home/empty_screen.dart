import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/firebase/firebase_database.dart';
import 'package:todo_app/data/model/app_task.dart';
import 'package:todo_app/data/model/app_users.dart';
import 'package:todo_app/home/add_task_screen.dart';
import 'package:todo_app/home/widget/task_item_widget.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/widget/matrial_buttom_widget.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({super.key});

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
  DateTime focusDate = DateTime.now();

  String formattedDate = DateFormat('MMMM-dd-yyyy').format(
    DateTime.now(),
  );
  AppUsers? user;
  List<AppTask> allTasks = [];

  @override
  void initState() {
    super.initState();
    getUser();
    getAllUsers();
  }

  void getUser() async {
    user = await FirebaseDatabase.getUser();
    setState(() {});
  }

  void getAllUsers() async {
    allTasks = await FirebaseDatabase.getAllTasks();
    allTasks = allTasks.where((task) {
      if (task.dateTime.day == focusDate.day &&
          task.dateTime.month == focusDate.month &&
          task.dateTime.year == focusDate.year) {
        return true;
      }
      return false;
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var siz = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.pDarkColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.pDarkColor,
        title: Row(
          children: [
            Text(
              formattedDate,
              style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Spacer(),
            Text(
              user?.name ?? "",
              style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 255, 123, 0)),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Gap(15),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Today",
                style: GoogleFonts.lato(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          const Gap(20),
          _easyInfiniteDateTimeLineWidget(),
          const Gap(50),
          allTasks.isEmpty
              ? Image.asset(
                  "assets/images/background_hs.png",
                  height: siz.height * .40,
                  width: siz.width * 80,
                )
              : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const Gap(15),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        _modalBouttomSheet(allTasks[index]);
                      },
                      child: TaskItemWidget(
                        siz: siz,
                        task: allTasks[index],
                      ),
                    ),
                    itemCount: allTasks.length,
                  ),
                ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
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
      firstDate: DateTime.now().subtract(Duration(days: 30)),
      focusDate: focusDate,
      lastDate: DateTime.now().add(const Duration(days: 90)),
      onDateChange: (selectedDate) {
        focusDate = selectedDate;
        getAllUsers();
        // setState(() {});
      },
      showTimelineHeader: false,
      physics: const BouncingScrollPhysics(),
      activeColor: const Color.fromARGB(255, 255, 123, 0),
      dayProps: const EasyDayProps(
        borderColor: Color.fromARGB(255, 255, 123, 0),
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
            fontSize: 20,
            fontWeight: FontWeight.w400),
        inactiveDayStyle: DayStyle(
            dayNumStyle: TextStyle(color: Color.fromARGB(255, 255, 123, 0))),
        activeMothStrStyle: TextStyle(
            color: Color.fromARGB(190, 255, 255, 255),
            fontSize: 20,
            fontWeight: FontWeight.w400),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _modalBouttomSheet(AppTask task) {
    showModalBottomSheet(
      backgroundColor: AppColors.pDarkColor,
      isDismissible: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ButtomLogin(
                title: "Task UpDate",
                onPressed: () async {
                  Navigator.of(context)
                      .pop(); // إغلاق الـ Bottom Sheet قبل التحديث
                  // نافذة إدخال لتحديث المهمة
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController titleController =
                          TextEditingController(text: task.title);
                      TextEditingController descriptionController =
                          TextEditingController(text: task.description);

                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width *
                              0.9, // عرض الشاشة بنسبة 90%
                          color: AppColors.pDarkColor,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Center(
                                  child: Text(
                                    "Update Task",
                                    style: GoogleFonts.lato(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Task Title",
                                  style: GoogleFonts.lato(
                                    color: Colors.orangeAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: titleController,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Enter task title",
                                    hintStyle:
                                        const TextStyle(color: Colors.white54),
                                    filled: true,
                                    fillColor:
                                        AppColors.pSocundColor.withOpacity(0.2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.orangeAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.orangeAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Task Description",
                                  style: GoogleFonts.lato(
                                    color: Colors.orangeAccent,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextField(
                                  controller: descriptionController,
                                  maxLines: 3,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Enter task description",
                                    hintStyle:
                                        const TextStyle(color: Colors.white54),
                                    filled: true,
                                    fillColor:
                                        AppColors.pSocundColor.withOpacity(0.2),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.orangeAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.orangeAccent),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      onPressed: () async {
                                        // تنفيذ التحديث
                                        await FirebaseDatabase.editTask(
                                            task.id, {
                                          'title': titleController.text,
                                          'description':
                                              descriptionController.text,
                                        });
                                        Navigator.of(context)
                                            .pop(); // إغلاق نافذة التحديث
                                        getAllUsers(); // تحديث قائمة المهام
                                      },
                                      child: const Text(
                                        "Update",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ButtomLogin(
                title: "Delete Task",
                onPressed: () async {
                  await FirebaseDatabase.deleteTask(task.id);
                  allTasks.remove(task);
                  Navigator.of(context).pop();
                  setState(() {});
                },
                color: const Color.fromARGB(255, 255, 0, 43),
              ),
              ButtomLogin(
                title: "Cancel",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
