import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer/screens/splash_screen/splash_screen.dart';

import '../cubids/timer_cubids/timer_cubid.dart';
import '../cubids/transfer_cubid/transfer_cubid.dart';
import '../data/repository/transfer_repository/transfer_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => TransferRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TransferCubit(
                transferRepository: context.read<TransferRepository>())
              ..getTransfers(),
          ),
          BlocProvider(create: (_) => TimerCubit()),
        ],
        child: const MyApp(),
      ),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
