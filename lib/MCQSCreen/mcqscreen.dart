import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_button/Global/global.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index=0;
  int correct=0,skip=0,wrong=0;
  String? user_answer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MCQ'),),
      body:index==mcqlist.length?reportView(): questionView(),
    );
  }
  Widget reportView()
  {
    return Column(
      children: [
        Text('Correct ${correct}'),
        Text('Skip ${skip}'),
        Text('Wrong ${wrong}')
        
      ],
    );
  }

  Column questionView() {
    return Column(
      children: [
        Text('Q#${index+1}: ${mcqlist[index].question}'),
        Row(
          children: [
            Radio(
              value: mcqlist[index].option1,
               groupValue: user_answer, 
               onChanged: (val){
                setState(() {
                  user_answer=val;
                });
               }),
               Text(mcqlist[index].option1)
          ],
        ),
         Row(
          children: [
            Radio(
              value: mcqlist[index].option2,
               groupValue: user_answer, 
               onChanged: (val){
                setState(() {
                  user_answer=val;
                });
               }),
               Text(mcqlist[index].option2)
          ],
        ),
         Row(
          children: [
            Radio(
              value: mcqlist[index].option3,
               groupValue: user_answer, 
               onChanged: (val){
                setState(() {
                  user_answer=val;
                });
               }),
               Text(mcqlist[index].option3)
          ],
        ),
        ElevatedButton(onPressed: (){
          setState(() {
            if(user_answer==null)
            {
              skip++;
            }
            else if(user_answer==mcqlist[index].correct)
            {
              correct++;
            }
            else{
              wrong++;
            }
            user_answer=null;
            index++;
          });
        }, child: Text('Next'))
      ],
    );
  }
}