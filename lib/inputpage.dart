import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/resultpage.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

int height = 180;
int age = 25;
int weight = 70;
double bmi=0;

class _InputPageState extends State<InputPage> {
  Color malecard = inactivecolor;
  Color femalecard = inactivecolor;
  void updateselect(Gender_enum select) {
    if (select == Gender_enum.male) {
      if (malecard == inactivecolor) {
        malecard = activecolor;
        femalecard = inactivecolor;
      } else {
        malecard = inactivecolor;
      }
    }
    if (select == Gender_enum.female) {
      if (femalecard == inactivecolor) {
        femalecard = activecolor;
        malecard = inactivecolor;
      } else {
        femalecard = inactivecolor;
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child:  Text(
            'BODY MASS INDEX',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontFamily: 'Rubik Doodle Shadow',
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateselect(Gender_enum.male);
                      });
                    },
                    color: malecard,
                    cardChild: const Gender(
                      img: Icons.male,
                      text: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        updateselect(Gender_enum.female);
                      });
                    },
                    color: femalecard,
                    cardChild: const Gender(
                      img: Icons.female,
                      text: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              color: inactivecolor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: barnumfont,
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activecolor,
                    inactiveColor: const Color(0xFF123562),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: inactivecolor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AddButton(
                              ico: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (weight == 0) {
                                    return;
                                  }
                                  weight -= 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AddButton(
                              ico: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    color: inactivecolor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w300),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 50),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AddButton(
                              ico: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  if (age == 0) {
                                    return;
                                  }
                                  age -= 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            AddButton(
                              ico: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  if (age == 130) {
                                    return;
                                  }
                                  age += 1;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                bmi = weight/((height/100)*(height/100));
              });
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResultPage()));
            },
            child: Container(
              width: double.infinity,
              height: 70,
              color: Colors.deepPurple,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}

class Gender extends StatelessWidget {
  const Gender({super.key, required this.img, required this.text});
  final IconData img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          img,
          size: 100.0,
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key,
      required this.color,
      required this.cardChild,
      required this.onPress});
  final Color color;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: cardChild,
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddButton({Key? key, required this.onPressed, required this.ico})
      : super(key: key);
  final IconData ico;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.black38,
      splashColor: activecolor,
      foregroundColor: Colors.white,
      shape: const CircleBorder(),
      child: Icon(ico),
    );
  }
}
