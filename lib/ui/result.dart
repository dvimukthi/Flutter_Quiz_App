import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz/controller/data_handler.dart';
import 'package:flutter_quiz/main.dart';

class Result extends StatelessWidget {
  final DataHandler data = Get.find();

  Result({Key? key}) : super(key: key);

  Future<bool> _onWillPop() async {
    Get.offAll(() => const MyHomePage());
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Results'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Answered questions: ${data.questionsList.length}'),
              Text(
                  'Correct answers: ${data.questionsList.where((element) => element.isAnswerCorrect).length}')
            ],
          ),
        ),
      ),
    );
  }
}
