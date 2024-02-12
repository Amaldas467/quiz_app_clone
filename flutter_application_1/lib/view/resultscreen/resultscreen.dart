import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color_constant.dart';
import 'package:flutter_application_1/view/homescreen/homescreen.dart';
import 'package:flutter_application_1/utils/database.dart';

class ResultScreen extends StatefulWidget {
  final int count;
  final int correctAnswers;
  final int wrongAnswers;
  final int skippedCount;

  ResultScreen({
    required this.count,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.skippedCount,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    int totalQuestions = Questiondb.literaturequestion.length;
    double percentage = (widget.count / totalQuestions) * 100;

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
            Text(
              '  ${percentage.toStringAsFixed(0)}% score',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colorconstant.mycustomgreen,
                fontSize: 40,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Correct Answers: ${widget.correctAnswers}',
              style: TextStyle(
                color: Colorconstant.mycustomwhite,
                fontSize: 20,
              ),
            ),
            Text(
              'Wrong Answers: ${widget.wrongAnswers}',
              style: TextStyle(
                color: Colorconstant.mycustomwhite,
                fontSize: 20,
              ),
            ),
            Text(
              'Skipped: ${widget.skippedCount}',
              style: TextStyle(
                color: Colorconstant.mycustomwhite,
                fontSize: 20,
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
                    builder: (context) => HomePage(),
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
