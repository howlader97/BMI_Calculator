import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  Color bgColor = Color(0xff0B102A);
  Color activeColor = Color(0xff272A4B);

  int height = 180;
  int weight= 60;
  int age=20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Color(0xff0B102A),
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Card(
                        color: isMale == true ? activeColor : bgColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: Colors.white,
                              size: 100,
                            ),
                            Text(
                              'Male',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        isMale = false;
                        setState(() {});
                      },
                      child: Card(
                        color: isMale == false ? activeColor : bgColor,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 100,
                            ),
                            Text(
                              'Female',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              flex: 10,
              child: Card(
                elevation: 5,
                color: activeColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text("Height",
                      style: TextStyle(color: Colors.white, fontSize: 25),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("$height", style: TextStyle(color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w800),),
                        Text("cm",
                          style: TextStyle(color: Colors.white, fontSize: 25),),
                      ],
                    ),

                    Slider(
                      value: height.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                      min: 100,
                      max: 240,
                    ),


                  ],
                ),
              )),
          Expanded(flex: 10, child: Row(
            children: [
              Expanded(
                  child: Card(
                    color: activeColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight',style: TextStyle(color: Colors.white,fontSize: 25),),
                        Text("$weight",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w800),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          MaterialButton(
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(Icons.add,color: Colors.white,),
                            color: Colors.blueAccent,
                            padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                            minWidth: 30,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                            const SizedBox(width: 16,),

                            MaterialButton(
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });

                              },
                              child: Icon(Icons.remove,color: Colors.white,),
                              color: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                              minWidth: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                        ],)
                      ],
                    ),


              )),
              Expanded(
                  child: Card(
                    color: activeColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age',style: TextStyle(color: Colors.white,fontSize: 25),),
                        Text("$age",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w800),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MaterialButton(
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add,color: Colors.white,),
                              color: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                              minWidth: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            const SizedBox(width: 16,),

                            MaterialButton(
                              onPressed: (){
                                setState(() {
                                  age--;
                                });

                              },
                              child: Icon(Icons.remove,color: Colors.white,),
                              color: Colors.blueAccent,
                              padding: EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                              minWidth: 30,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ],)
                      ],
                    ),


                  ))
            ],
          )),
          InkWell(
            onTap: (){
              double bmi = weight / ((height / 100) * (height / 100));
             // print("BMI is $bmi");
              String result = getResult(bmi);
             // print("result is$result");
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  ResultScreen(
                    result: result,
                    bmi: bmi,

                  )));
            },
            child: Container(
                child: Center(
                    child: Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 24),
                )),
                height: 80,
                color: Colors.pink),
          )
        ],
      ),
    );
  }
  String getResult(double bmi){
    if (bmi >= 25) {
      return "You have a higher then normal body weight. Try to exercise more.";
    }
    else if (bmi > 18.5) {
      return "You have a normal body weight. Good job!";
    }
    else {
      return "You have a lower then normal body weight. You can eat a bit more.";
    }
  }

}
