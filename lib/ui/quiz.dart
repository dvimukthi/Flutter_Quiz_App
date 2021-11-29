import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz/controller/data_handler.dart';
import 'package:flutter_quiz/ui/result.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  DataHandler data = Get.find();
  int currentQuestion = 0;
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questions For ${data.userName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                    trailing: Text(
                        '${currentQuestion + 1} / ${data.questionsList.length}'),
                    width: 140.0,
                    lineHeight: 14.0,
                    percent: (currentQuestion + 1) / data.questionsList.length,
                    backgroundColor: Colors.yellow,
                    progressColor: Colors.red),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                data.questionsList[currentQuestion].title,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(data.questionsList[currentQuestion].answers.first),
              leading: Radio(
                value: data.questionsList[currentQuestion].answers.first,
                groupValue: answer,
                activeColor: Colors.green,
                onChanged: (String? value) {
                  setState(() {
                    answer = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(data.questionsList[currentQuestion].answers[1]),
              leading: Radio(
                value: data.questionsList[currentQuestion].answers[1],
                groupValue: answer,
                activeColor: Colors.green,
                onChanged: (String? value) {
                  setState(() {
                    answer = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(data.questionsList[currentQuestion].answers[2]),
              leading: Radio(
                value: data.questionsList[currentQuestion].answers[2],
                groupValue: answer,
                activeColor: Colors.green,
                onChanged: (String? value) {
                  setState(() {
                    answer = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(data.questionsList[currentQuestion].answers.last),
              leading: Radio(
                value: data.questionsList[currentQuestion].answers.last,
                groupValue: answer,
                activeColor: Colors.green,
                onChanged: (String? value) {
                  setState(() {
                    answer = value!;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (answer == data.questionsList[currentQuestion].answer) {
                    data.questionsList[currentQuestion].isAnswerCorrect = true;
                    Fluttertoast.showToast(
                        msg: "Answer is correct",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.black,
                        fontSize: 16.0);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Wrong answer",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                  if (data.questionsList.length == currentQuestion + 1) {
                    Get.to(() => Result());
                  } else {
                    setState(() {
                      currentQuestion++;
                    });
                  }
                },
                child: const Text('Next'),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.red))))),
          ],
        ),
      ),
    );
  }
}
