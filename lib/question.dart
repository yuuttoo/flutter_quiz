import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;//加上final 表示這個值不會被改變 無法reassign  上面的class才不會現警告

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(100),//與上方的距離100
      child: Text(
      questionText, 
      style: TextStyle(fontSize: 28),
      textAlign: TextAlign.center,
    ),
    ); 
  }
}