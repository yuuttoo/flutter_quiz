import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
        @required this.questions, 
        @required this.answerQuestion, 
        @required this.questionIndex,
        });

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
        Question(
          questions[questionIndex]['questionText'],
          ),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
        .map((answer) {//傳同一陣列的每個值，用map
        return Answer(() => answerQuestion(answer['score']), answer['text']);// answerQuestion(),加括弧才會被驅動
      }).toList()//toList把結果分散到獨立widget  此處為選項欄位
       ],
    );
  }
}