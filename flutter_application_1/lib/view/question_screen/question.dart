import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color_constant.dart';
import 'package:flutter_application_1/utils/database.dart';
import 'package:flutter_application_1/view/resultscreen/resultscreen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionindex = 0;
  int? selectedindex;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colorconstant.mycustomblack,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "${questionindex + 1}/${Questiondb.question.length}",
              style: TextStyle(
                color: Colorconstant.mycustomwhite,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colorconstant.mycustomgrey,
              ),
              child: Text(
                Questiondb.question[questionindex]["question"].toString(),
                style: TextStyle(
                  color: Colorconstant.mycustomwhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // 2nd container
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    selectedindex = index;
                    getcolor(index);
                    print('selectedindex');
                    if (selectedindex != [index]) {
                      ////
                      index++;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      color: getcolor(index),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 3,
                        color: getcolor(index),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Questiondb.question[questionindex]["options"][index]
                                .toString(),
                            style: TextStyle(
                              color: Colorconstant.mycustomwhite,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colorconstant.mycustomwhite,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, optionIndex) => SizedBox(height: 0),
            itemCount: Questiondb.question[questionindex]["options"].length,
          ),

          SizedBox(
            height: 10,
          ),

          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colorconstant.mycustomblue),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
            ),
            onPressed: () {
              if (selectedindex != null &&
                  selectedindex ==
                      Questiondb.question[questionindex]["answer"]) {
                count++;
              }
              selectedindex = null;
              if (questionindex + 1 < Questiondb.question.length) {
                setState(() {
                  questionindex++;
                });
              } else {
                print('Correct Answers: $count');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(count: count),
                  ),
                );
              }
            },
            child: Text(
              "       Next      ",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Color getcolor(int index) {
    if (selectedindex != null &&
        index == Questiondb.question[questionindex]["answer"]) {
      return Colorconstant.mycustomgreen;
    }
    if (selectedindex == index) {
      if (selectedindex == Questiondb.question[questionindex]["answer"]) {
        return Colorconstant.mycustomgreen;
      } else {
        return Colorconstant.mycustomred;
      }
    } else {
      return Colorconstant.mycustomgrey;
    }
  }
}
