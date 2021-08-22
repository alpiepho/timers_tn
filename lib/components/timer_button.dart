import 'package:flutter/material.dart';
//import 'package:timers_tn/constants.dart';

class TimerButton extends StatelessWidget {
  TimerButton({
    required this.color, 
    required this.margin, 
    required this.portrait,
    this.gradient = true,
    this.disabled = false,
    this.cardChild, 
    this.onPress});

  final Color color;
  final EdgeInsets margin;
  final bool portrait;
  final bool gradient;
  final bool disabled;
  final Widget? cardChild;
  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress as void Function()?,
        //enableFeedback: false,
        //splashColor: (disabled ? Colors.transparent : Colors.white),
        child: Container(
          child: cardChild,
          margin: margin,
          width: double.infinity,
        ),
      );
  }
}
