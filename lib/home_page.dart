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
Answer? selectedAnswer;

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      style: TextStyle(fontSize: 20),
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
              for (Answer ans in questionList[currentQuestionIndex].answerList)
                AnimatedButton(
                  onPressed: (){
                    setState(() {
                      selectedAnswer = ans ;
                    });
                  },
                  child: Text(ans.answerText,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  color: selectedAnswer == ans ? Colors.green :Colors.white,
                ),
              SizedBox(height: 20,),
              AnimatedButton(
                width: 300,
                onPressed: (){
                  setState(() {
                    currentQuestionIndex < questionList.length-1 ?currentQuestionIndex++ : print("ok");
                  });
                },
                child: Text(currentQuestionIndex+1==questionList.length? "Submit":"Next",style: TextStyle(fontSize: 25),),
                color: Colors.blueAccent,
              ),
              AnimatedButton(
                //width: 300,
                onPressed: (){
                  setState(() {
                    currentQuestionIndex>0 ?currentQuestionIndex-- : print("ok") ;
                  });
                },
                child: Text("Back",style: TextStyle(fontSize: 25),),
                color: Colors.redAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
