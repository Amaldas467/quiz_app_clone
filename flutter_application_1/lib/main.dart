import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/homescreen/homescreen.dart';
//import 'package:flutter_application_1/view/question_screen/question.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: QuestionScreen(),
      home: HomePage(),
    );
  }
}
