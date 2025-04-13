import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  double ? bmi;
  String result;
   ResultScreen({super.key,  this.bmi,required this.result});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xff0B102A),
      body: Padding(
        
        padding: const EdgeInsets.all(28.0),
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Your Bmi is ${bmi!.toStringAsFixed(2)}",style: TextStyle(color:Color(0xffFFFFFF),fontSize: 30,fontWeight: FontWeight.bold),),
            Text("$result",style: TextStyle(color:Color(0xffFFFFFF),fontSize: 30,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
