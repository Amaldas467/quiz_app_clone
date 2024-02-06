import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color_constant.dart';
import 'package:flutter_application_1/view/question_screen/question.dart';
import 'package:flutter_application_1/utils/database.dart';

class ResultScreen extends StatelessWidget {
  int count;

  ResultScreen({required this.count});

  @override
  Widget build(BuildContext context) {
    int totalQuestions = Questiondb.question.length;
    double percentage = (count / totalQuestions) * 100;

    return Scaffold(
      backgroundColor: Colorconstant.mycustomblack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Congrats!",
              style: TextStyle(
                color: Colorconstant.mycustomwhite,
                fontSize: 30,
              ),
            ),
            Center(
              child: Text(
                '  ${percentage.toStringAsFixed(0)}% score',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colorconstant.mycustomgreen,
                  fontSize: 40,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 120,
                child: Center(
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colorconstant.mycustomwhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colorconstant.mycustomblue,
                  border: Border.all(
                    color: Colorconstant.mycustomwhite,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
