import 'package:cloud_firestore/cloud_firestore.dart';

import 'Answer.dart';

class Question {
  String id;
  String question;
  List<Answer> answers;
  String? correctAnswer;

  Question(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Question.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers =
            (json['answers'] as List).map((e) => Answer.fromJson(e)).toList(),
        correctAnswer = json['correct_answer'];


  Question.fromSnapshot(QueryDocumentSnapshot<Map<String , dynamic>> snapshot)
  :id = snapshot.id,
  question = snapshot['question'],
  answers = [],
  correctAnswer = snapshot['correct_answer']
  ;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}
