import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:timer/data/model/free_time_model.dart';
import 'package:timer/screens/start_timer/start_timer_screen.dart';
import 'package:timer/utils/images/images.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  TextEditingController hour = TextEditingController();
  TextEditingController second = TextEditingController();
  String work = "";
  int count = 0;

  List freeTime = [];
  List freeTimes = [
    FreeTime(1, "Kitob o'qish"),
    FreeTime(2, "Uxlash"),
    FreeTime(3, "Kino Korish"),
    FreeTime(4, "Oyin oynash"),
    FreeTime(5, "Dars qilish"),
    FreeTime(6, "Instagramsiz soat"),
    FreeTime(7, "Turnikda osilish"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timer"),
        actions: [
          Image.asset(AppImages.avatar, width: 40.w, fit: BoxFit.cover),
          SizedBox(
            width: 15.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: ListView(
          children: [
            Text(
              "Set Your Time",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 45.sp),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                    color: const Color(0xFFE3E9E9),
                    borderRadius: BorderRadius.circular(25.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter Time",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 90,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: hour,
                              decoration: const InputDecoration(
                                hintText: "Minute",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black))),
                            )),
                        Text(
                          ":",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 60.sp),
                        ),
                        SizedBox(
                            width: 90,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: second,
                              decoration: const InputDecoration(
                                  hintText: "Second",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black))),
                            )),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            MultiSelectDialogField(
              items: freeTimes.map((e) => MultiSelectItem(e, e.name)).toList(),
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                freeTime = values;
                work = freeTime[0].name.toString();
                setState(() {

                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 30.h),
              child: SizedBox(
                width: double.infinity,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF00696B)
                  ),
                  onPressed: () {
                    count += int.parse(hour.text) * 60;
                    count += int.parse(second.text);
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=>StartTimer(second:count , work: work)));
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
