import 'package:flutter/material.dart';
import 'Model.dart';
import 'package:animated_button/animated_button.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

List<Question> questionList = getQuestions();
int currentQuestionIndex = 0;
int score = 0;
Answer selectedAnswer = Answer("0", false);
int? score2;

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Simple Quiz App",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Question ${currentQuestionIndex + 1} / ${questionList.length}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,

                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      questionList[currentQuestionIndex].questionText,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    alignment: Alignment.center,
                  ),
                  Positioned(
                    top: 26,
                    left: -24,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 26,
                    right: -24,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: -20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check,
                        size: 40,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                          color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Container(
                      width: double.infinity,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 26,
                    left: -24,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                  Positioned(
                    top: 26,
                    right: -24,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              for (Answer ans in questionList[currentQuestionIndex].answerList)
                AnimatedButton(
                  onPressed: () {
                    setState(() {
                      selectedAnswer = ans;
                    });
                  },
                  child: Text(
                    ans.answerText,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  color: selectedAnswer == ans ? Colors.green : Colors.white,
                ),
              SizedBox(
                height: 20,
              ),
              AnimatedButton(
                width: 280,
                onPressed: () {
                  setState(() {
                    selectedAnswer.isCorrect ? score++ : {};
                    currentQuestionIndex < questionList.length - 1
                        ? currentQuestionIndex++
                        : {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Text(
                                    "Passed | Score is ${score.toString()}/${questionList.length}",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      AnimatedButton(
                                        onPressed: () {
                                          setState(() {
                                            score = 0;
                                            currentQuestionIndex = 0;
                                            Navigator.of(context).pop();
                                            selectedAnswer = Answer("0", false);
                                          });
                                        },
                                        width: 100,
                                        height: 50,
                                        child: Text(
                                          "Restart",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          };
                  });
                },
                child: Text(
                  currentQuestionIndex + 1 == questionList.length
                      ? "S u b m i t"
                      : "N e x t",
                  style: TextStyle(fontSize: 25),
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// AnimatedButton(
// //width: 300,
// onPressed: () {
// setState(() {
// currentQuestionIndex > 0
// ? currentQuestionIndex--
//     : print("ok");
// });
// },
// child: Text(
// "Back",
// style: TextStyle(fontSize: 25),
// ),
// color: Colors.redAccent,
// ),
