import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitialState());

  late Timer _timer;
  int remainingTime = 0;
  bool exitProgram = false;
  int minute = 0;
  int seccond = 0;

  startTimer(int second) {
    seccond = second % 60;
    emit(TImerCalculatingState());
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (timer) {
        if(second > 60){
          if (minute == 0 && seccond < 1) {
              _timer.cancel();
              emit(TimerResultState(remainingTime < 1 ? true : false , minute.toString() , seccond.toString()));
          } else {
            second = second - 1;
            minute = second ~/ 60;
            seccond--;
            if(minute > 0 && seccond == 0){
              seccond = 59;
            }
            emit(TimerResultState(second < 1 ? true : false , minute.toString() , seccond.toString()));
          }
        }
        else{
          minute = 0;
          if (minute == 0 && seccond < 1) {
            _timer.cancel();
            emit(TimerResultState(remainingTime < 1 ? true : false , minute.toString() , seccond.toString()));
          } else {
            second = second - 1;
            seccond--;
            if(minute > 0 && seccond == 0){
              seccond = 59;
            }
            emit(TimerResultState(second < 1 ? true : false , minute.toString() , seccond.toString()));
          }
        }
      },
    );
  }
}
