import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components_and_constants/make_containter.dart';
import '../components_and_constants/icon_content.dart';
import '../components_and_constants/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selected;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MakeContainer(
                    colour: selected == Gender.male ? kActiveCardColour : kPassiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                    onPress: () {
                      setState(() {
                        selected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: MakeContainer(
                    colour: selected == Gender.female ? kActiveCardColour : kPassiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                    onPress: () {
                      setState(() {
                        selected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MakeContainer(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "HEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "cm",
                              style: kLabelTextStyle,
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.5),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x1FEB1555),
                            trackHeight: 2.0,
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MakeContainer(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: kLabelTextStyle,),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MakeContainer(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: kLabelTextStyle,),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE MY BMI",
            onTap: () {

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                    bmiResult: calc.calculationResults(),
                    interpretation: calc.getInterpretation(),
                    resultText: calc.getResults(),
                  ))
              );
            },
          ),
        ],
      ),
    );
  }
}

// you can't have a color outside if you're using a
// BoxDecoration. color for container is shorthand
// so we won't have to write decoration: BoxDecoration
// over and over again. If we have BoxDec, we have to
// put the color property in there.
