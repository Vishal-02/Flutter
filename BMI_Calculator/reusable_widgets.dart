import 'package:flutter/material.dart';
import 'package:bmi_calculator/components_and_constants/constants.dart';

class MakeContainer extends StatelessWidget {
  // const MakeContainer({
  //   Key key,
  // }) : super(key: key);
  //this constructor above is unnecessary for us.
  //it is unnecessary in most cases, but we're going to make
  //our own constructor
  //adding @required before this.color will make it required
  //i did it but it said that it was redundant, so i removed
  //it ...
  //edit: it was not redundant after I covered the this.color
  //with the {} and put @required inside that... how does
  //this work? It feels like something I know by instinct
  //but I don't really know how to explain it.
  MakeContainer({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;
  //'final' makes this property immutable, remove it and
  //read what happens, it kind of makes sense.

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // color: Color(0xFF1D1E33),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onTap, @required this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        padding: EdgeInsets.only(bottom: 5.0),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 60.0,
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({this.icon, this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        onPress();
      },
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
      disabledElevation: 6.0,
      elevation: 3.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
    );
  }
}

