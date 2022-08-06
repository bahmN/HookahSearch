import 'package:flutter/material.dart';
import 'package:hookah_search/mainMenu/mainMenuWidgets.dart';
import 'package:sizer/sizer.dart';
import 'mainMenu/mainMenuScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: ('PTMono')),
          home: const Scaffold(
            body: SafeArea(
              child: MainMenuScreen(),
            ),
            drawer: CustomDrawer(),
          ),
        );
      },
    );
  }
}
