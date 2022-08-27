import 'package:examen_app/qs.dart';
import 'package:flutter/material.dart';

import 'qsList.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    examen(),
  );
}

class examen extends StatelessWidget {
  const examen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Examen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ExamPage(),
        ),
      ),
    );
  }
}

class ExamPage extends StatefulWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  List<Widget> answers = [];
  //List qs = ['Image 1 ?', 'Image 2 ?', 'Image 3 ?', 'Image 4 ?'];
  //List<bool> awns = [true, false, true, false];
  int qsNumber = 0;
  int rigthanswers = 0;
  //Qs question1 = new Qs('Image 1 ?', 'images/image-1.png', true);
  QsList qss = new QsList();

  void checkanswer(int qsNumber, bool button) {
    if (qss.getQsAnswer(qsNumber) == button) {
      answers.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_up,
            color: Colors.green,
          ),
        ),
      );
      rigthanswers++;
    } else {
      answers.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Row(
                children: answers, // for read the list of awnsers (thumbs)
              ),
              Image.asset(qss.getQsImage(qsNumber)),
              SizedBox(
                height: 20,
              ),
              Text(
                //qs[qsNumber],
                qss.getQstext(qsNumber),
                textAlign: TextAlign.center,
                style: (TextStyle(
                    fontSize: 30,
                    backgroundColor: Colors.grey[450],
                    fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              child: Text('True',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              onPressed: () {
                checkanswer(qsNumber, true);

                setState(
                  () {
                    if (qsNumber < qss.getLength() - 1) {
                      qsNumber++;
                    } else {
                      Alert(
                              context: context,
                              title: "End of the Exam.",
                              desc: "You Have $rigthanswers correct Answers.")
                          .show();
                      qsNumber = 0;
                      answers = [];
                      rigthanswers = 0;
                    }
                  },
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              onPressed: () {
                checkanswer(qsNumber, false);
                setState(
                  () {
                    if (qsNumber < qss.getLength() - 1) {
                      qsNumber++;
                    } else {
                      Alert(
                              context: context,
                              title: "End of the Exam. ",
                              desc: "You Have $rigthanswers correct Answers.")
                          .show();
                      qsNumber = 0;
                      answers = [];
                      rigthanswers = 0;
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
