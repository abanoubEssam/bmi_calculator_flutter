import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';



class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  GenderEnum? selectedGender;
  int initialHeight = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calc'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = GenderEnum.male;
                        });
                      },
                      color: selectedGender == GenderEnum.male ? activeColor : inActiveColor,
                      cardChild: IconWidget('MALE' , FontAwesomeIcons.mars),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = GenderEnum.female;
                        });
                      },
                      color: selectedGender == GenderEnum.female ? activeColor : inActiveColor,
                      cardChild: IconWidget('FEMALE' , FontAwesomeIcons.venus),
                    ),
                  )
                ],
              )

          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text('HEIGHT' ,
                            style: labelTextStyle
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(initialHeight.toString(),
                              style: numberTextStyle
                              ),
                              Text('cm',
                              style: labelTextStyle
                              ),

                            ],

                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                activeTrackColor: Colors.white,
                                inactiveTrackColor: Color(0xFF8D8E98),
                                thumbColor: Color(0xFFEB1555),
                                overlayColor:Color(0x29EB1555) ,
                                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                                overlayShape: RoundSliderOverlayShape(overlayRadius: 24),
                                trackHeight: 1
                            ),
                            child: Slider(
                              value: initialHeight.toDouble(),
                              min: 120,
                              max: 220,
                              onChanged: (double value){
                                setState(() {
                                  initialHeight = value.toInt();
                                });
                              },
                            ),
                          )
                        ],
                      ),

                    ),
                  ),

                ],
              )

          ),
          Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT' ,
                              style: labelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: numberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(icon: FontAwesomeIcons.minus,
                                  press: (){
                                         setState(() {
                                                weight--;
                                          });
                                         } ,
                                ),
                                SizedBox(width: 10,),
                                RoundIconButton(icon: FontAwesomeIcons.plus,
                                  press: (){
                                    setState(() {
                                      weight++;
                                    });
                                  } ,
                                ),

                              ],
                            )
                          ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE' ,
                            style: labelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: numberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus,
                                press: (){
                                  setState(() {
                                    age--;
                                  });
                                } ,
                              ),
                              SizedBox(width: 10,),
                              RoundIconButton(icon: FontAwesomeIcons.plus,
                                press: (){
                                  setState(() {
                                    age++;
                                  });
                                } ,
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )

          ),
          ButtonBottom(
            buttonTitle: "Calculate",
            onTap: () {
              CalculatorBrain calculate =  CalculatorBrain(height: initialHeight , weight: weight );


              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResultsPage(
                      bmiResult: calculate.calculateBMI(),
                      resultText: calculate.getResult(),
                      interpretation: calculate.getInterpretation(),
                  )));
            },
          ),
        ],

      ),

    );
  }
}
