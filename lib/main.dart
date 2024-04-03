// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'app/app.dart';
//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await SystemChrome.setPreferredOrientations([
//     DeviceOrientation.portraitUp,
//     DeviceOrientation.portraitDown,
//   ]);
//
//   runApp(const App());
// }
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  AudioPlayer audioPlayer = AudioPlayer();

  void _startTimer() async {
    // Timer boshlandi
    // Kerakli kodlar...

    // Musiqa yoki ovozni o'ynatish
    await audioPlayer.play('assets/voice/golos.mp3' as Source, isLocal: true);
    // if (result == 1) {
    //   // Ovoz muvaffaqiyatli boshlandi
    // } else {
    //   // Ovozni boshlashda xatolik yuz berdi
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer Dasturi'),
      ),
      body: Center(
        child: TextButton(
          onPressed: _startTimer,
          child: Text('Timerni boshlash'),
        ),
      ),
    );
  }
}
