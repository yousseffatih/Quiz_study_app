import 'package:cloud_firestore/cloud_firestore.dart';

class Answer {
  String? identifier;
  String? answer;

  Answer({this.identifier, this.answer});

  Answer.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['Answer'];

  Answer.fromSnapshot(QueryDocumentSnapshot snapshot)
      : identifier = snapshot['identifier'] as String,
        answer = snapshot['Answer'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = identifier;
    data['Answer'] = answer;
    return data;
  }
}
