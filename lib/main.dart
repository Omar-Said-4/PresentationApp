

import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbook/cubit/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Start.dart';
import 'cubit/AppCubit.dart';
import 'cubit/AppStates.dart';

void main ()  {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(DateTime.now().minute);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, states) {},
          builder: (context, states) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Let us enjoy flutter',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              home: splash_screen(),
            );
          }),
    );
  }
}

