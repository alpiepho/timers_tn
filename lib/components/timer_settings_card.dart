import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timers_tn/components/toggle_choice.dart';
import 'package:timers_tn/constants.dart';

class TimerSettingsCard extends StatelessWidget {
  TimerSettingsCard({
    required this.number,
    required this.upDownIndex,
    required this.startMsString,
    required this.soundIndex,
    required this.upDownToggleFunction,
    required this.startChangeFunction,
    required this.soundToggleFunction,
  });

  final int number;
  final int upDownIndex;
  final String startMsString;
  final int soundIndex;
  final Function(int) upDownToggleFunction;
  final Function(String) startChangeFunction;
  final Function(int) soundToggleFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 20.0,
          thickness: 2.0,
        ),
        new Text(
          "    Timer " + number.toString(),
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        new SizedBox(height: 10),
        ToggleChoice(
          index: this.upDownIndex,
          label: "    count down",
          onToggle: upDownToggleFunction,
        ),
        new SizedBox(height: 10),
        ToggleChoice(
          index: this.soundIndex,
          label: "    sound",
          onToggle: soundToggleFunction,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
          child: new TextFormField(
            keyboardType: TextInputType.number,
            decoration: new InputDecoration.collapsed(
              hintText: 'milliseconds',
            ),
            autofocus: false,
            initialValue: this.startMsString,
            onChanged: startChangeFunction,
            style: kSettingsTextEditStyle,
          ),
        ),
      ],
    );
  }
}
