import 'package:flutter/material.dart';

import 'quiz.dart';
import './result.dart';

// void main(){
//   runApp(MyApp());

// }
void main() => runApp(MyApp()); //只有一個class 也可以這樣寫
//void main() List<String> questions

class MyApp extends StatefulWidget { //StatefulWidget 比較複雜，需要兩個class
  @override//加上create state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {//需繼承myapp

 final _questions = const [//用MAP 管理複雜資料狀態
      {'questionText': 'What\'s your favorite color?',
       'answers': [
        {'text':'Black','score': 10}, 
        {'text':'Red','score': 8}, 
        {'text':'Green', 'score': 5},
        {'text':'White','score': 3}
          ],
      },
      {'questionText': 'What\'s your favorite animal?', 
      'answers':[
        {'text':'Rabbit','score': 10},  
        {'text':'Lion', 'score': 8}, 
        {'text':'Panda', 'score': 4}, 
        {'text':'Tiger','score': 2}
      ],
      },
       {'questionText': 'Who\'s your favorite instructor?', 
      'answers':[ 
        {'text':'Max',  'score': 1},  
        {'text':'Max',  'score': 1}, 
        {'text':'Max',  'score': 1}, 
        {'text':'Max',  'score': 1} 
        ],
      }
      ];
  var _questionIndex = 0;
  var _totalScore = 0;


  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }
  
  void _answerQuestion(int score) {//回答問題函數加入score參數，每次驅動都會累積，把這個model函式傳到quiz 實作

    _totalScore += score;//總分會加總
    
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
      print (_questionIndex);

     if(_questionIndex < _questions.length){ //question被scope擋住 放到class 層級, questions.length=3
      print('We have more qustions!');
    } else {
      print('No more questions!');
    }
   
  
}
  

  @override  
  Widget build(BuildContext context) {        

   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Firtst App'),
      ),
      body: _questionIndex < _questions.length 
      ? Quiz(
        answerQuestion: _answerQuestion, 
        questionIndex: _questionIndex, 
        questions: _questions 
        )
      : Result(_totalScore, _resetQuiz),//括弧內為傳值用  可傳到外部檔案
      ),
    );
  }
}