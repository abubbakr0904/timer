
part of 'timer_cubid.dart';

abstract class TimerState {}

class TimerInitialState extends TimerState {}

class TimerResultState extends TimerState {
  final String minute;
  final String second;
  final bool isTimer;

  TimerResultState(this.isTimer, this.minute, this.second,);
}

class TImerCalculatingState extends TimerState {}

class TimerInputErrorState extends TimerState {
  final String errorCause;

  TimerInputErrorState(this.errorCause);
}
