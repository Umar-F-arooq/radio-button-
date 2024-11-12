import 'package:flutter/material.dart';

class SimpleRadioExample extends StatefulWidget {
  const SimpleRadioExample({super.key});

  @override
  State<SimpleRadioExample> createState() => _SimpleRadioExampleState();
}

class _SimpleRadioExampleState extends State<SimpleRadioExample> {
  String ?gender;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(children: [
            Radio(value: "Male", 
                  groupValue: gender, 
                  onChanged: (String? val){
                    setState(() {
                      gender=val;
                    });

                  }),
                  Text('Male')
          ],),
          Row(children: [
            Radio(value: "Female", 
                  groupValue: gender, 
                  onChanged: (String? val){
                    setState(() {
                      gender=val;
                    });

                  }),
                  Text('Female')
          ],),
          gender==null?Text(''):Text('Selected Value ${gender!}')
        ],
      ),

    );
  }
}