import 'package:flutter/material.dart';
import 'package:timers_tn/components/toggle_choice.dart';

class TimerEnableCard extends StatelessWidget {
  TimerEnableCard({
    required this.number, 
    required this.index,
    required this.label,
    required this.toggleFunction,
  });

  final int number;
  final int  index;
  final String label;
  final Function(int) toggleFunction;

  @override
  Widget build(BuildContext context) {
    var newLabel = label;
    if (label == "")
      newLabel = "    Timer " + number.toString();
    return Column (children: [
      new SizedBox(height: 10),
      ToggleChoice(
        index: this.index,
        label: newLabel,
        onToggle: toggleFunction,
      ),
    ]);
  }
}
