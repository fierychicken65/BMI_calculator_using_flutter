import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/inputpage.dart';


class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          toolbarHeight: 100,
          title: const Center(
            child: Text(
              'RESULT',
              style: TextStyle(
                color: Colors.greenAccent,
                fontWeight: FontWeight.w900,
                fontFamily: 'Rubik Doodle Shadow',
                fontSize: 60,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ReusableCard(
                onPress: () {},
                color: inactivecolor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('OBESE',style: TextStyle(fontSize: 20),),
                    const SizedBox(
                      height: 15,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(bmi.toStringAsFixed(2),style:const TextStyle(fontWeight:FontWeight.w900,fontSize: 60 ),)
                      ],
                    ),

                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 70,
                color: Colors.deepPurple,
                child: const Center(
                  child: Text(
                    'RECALCULATE',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),

              ),
            )
          ],
        )
    );
  }
}
