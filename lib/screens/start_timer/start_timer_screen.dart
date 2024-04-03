import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer/cubids/timer_cubids/timer_cubid.dart';

class StartTimer extends StatefulWidget {
  const StartTimer({super.key, required this.second, required this.work});

  final int second;
  final String work;

  @override
  State<StartTimer> createState() => _StartTimerState();
}

class _StartTimerState extends State<StartTimer> {
  late Timer _timer;
  bool exitProgram = false;

  @override
  Widget build(BuildContext context) {
    context.read<TimerCubit>().startTimer(widget.second);
    return WillPopScope(
      onWillPop: () async {
        print(exitProgram.toString() + "mana");
        return exitProgram;
      },
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<TimerCubit, TimerState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case TimerInputErrorState:
                    {
                      state as TimerInputErrorState;
                      Future.microtask(
                        () => ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.errorCause),
                          ),
                        ),
                      );
                    }
                  case TimerInitialState:
                    {
                      Future.microtask(() =>
                          context.read<TimerCubit>().startTimer(widget.second));
                    }
                  case TImerCalculatingState:
                    return const Center(
                      child: Text("Timer!..."),
                    );
                  case TimerResultState:
                    {
                      state as TimerResultState;
                      exitProgram = state.isTimer;
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        width: double.infinity,
                        height : MediaQuery.of(context).size.height,
                        color : exitProgram ? Colors.white : const Color(0xFFC5EFAB),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 200.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100.r),
                                  border: Border.all(
                                      width: 3, color: Colors.black)),
                              child: Center(
                                child: Text(
                                  "${state.minute} : ${state.second}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 50.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: 20.w),
                                padding: EdgeInsets.all(20.w),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.r),
                                    color: Colors.green.withOpacity(0.1)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.work,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(Icons.cancel_outlined)
                                  ],
                                )),
                            SizedBox(
                              height: 50.h,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                  exitProgram ? Icons.arrow_back : Icons.lock,
                                  size: 60,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      );
                    }
                }
                return const Center(
                  child: Text("Default, Initial state"),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
