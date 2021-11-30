import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz/controller/data_handler.dart';
import 'package:flutter_quiz/model/question.dart';
import 'package:flutter_quiz/ui/quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red[100],
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(),
      initialBinding: BindingsBuilder(() => {
            Get.put(DataHandler()),
          }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController nameController = TextEditingController();

  _showDialog() {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text(
          'QUIZ GAME',
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Column(
            children: [
              const Text('Enter Your Name'),
              TextField(
                controller: nameController,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () {
                DataHandler data = Get.find();
                data.userName = nameController.text;
                data.questionsList = [
                  QuestionModel(
                    'Which is the currency of Sri Lanka ?',
                    'Rupee',
                    ['Yen', 'Euro', 'Rupee', 'Dirham'],
                  ),
                  QuestionModel(
                    'Sri Lanka won Cricket World Cup in ?',
                    '1996',
                    ['2007', '1996', '2015', '2019'],
                  ),
                  QuestionModel(
                    'What is the national sport of Sri lanka ?',
                    'Vollyball',
                    ['Vollyball', 'Cricket', 'Football', 'Rugby'],
                  ),
                  QuestionModel(
                    'What is the tallest waterfall in sri lanka ?',
                    'Bambarakanda',
                    ['Dunhinda', 'Ramboda', 'Diyaluma', 'Bambarakanda'],
                  ),
                  QuestionModel(
                    'What is the longest river in the world ?',
                    'Nile',
                    ['Amazon', 'Nile', 'Yangtze', 'Congo'],
                  ),
                  QuestionModel(
                    'What is the capital of Australia ?',
                    'Canberra',
                    ['Canberra', 'Melbourne', 'Perth', 'Sydney'],
                  ),
                  QuestionModel(
                    'In which country is the Taj Mahal located ?',
                    'India',
                    ['China', 'USA', 'Pakistan', 'India'],
                  ),
                  QuestionModel(
                    'Who invented the lightbulb ?',
                    'Thomas Edison',
                    [
                      'Albert Einstein',
                      'Thomas Edison',
                      'Galileo Galilei',
                      'Blaise Pascal'
                    ],
                  ),
                  QuestionModel(
                    'Who painted the Mona Lisa ?',
                    'Leonardo da Vinci',
                    [
                      'Pablo Picasso',
                      'Michel angelo',
                      'Leonardo da Vinci',
                      'Raphael'
                    ],
                  ),
                  QuestionModel(
                    'Where exactly is the Eiffel Tower located ?',
                    'Paris',
                    ['Rome', 'New York', 'London', 'Paris'],
                  ),
                ];
                Get.back();
                Get.to(() => const QuestionScreen());
              },
              child: const Text('Ok')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: _showDialog,
            child: const Text('Start Game'),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: Colors.red))))),
      ),
    );
  }
}
