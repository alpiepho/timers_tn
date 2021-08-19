import 'package:flutter/material.dart';
import 'package:timers_tn/constants.dart';
import 'package:timers_tn/engine.dart';
import 'package:timers_tn/components/toggle_row.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SettingsModal extends StatefulWidget {
  late BuildContext context;
  late Engine engine;
  late Function onDone;

  SettingsModal(BuildContext context, Engine engine, Function onDone) {
    this.context = context;
    this.engine = engine;
    this.onDone = onDone;
  }

  @override
  _SettingsModal createState() => _SettingsModal(context, engine, onDone);
}

class _SettingsModal extends State<SettingsModal> {
  _SettingsModal(BuildContext context, Engine engine, Function onDone) {
    this.context = context;
    this.engine = engine;
    this.onDone = onDone;

    this._rowsIndex1 = 0;
    this._rowsIndex2 = 0;
  }

  late BuildContext context;
  late Engine engine;
  late Function onDone;

  late var selectedRate;
  late List<String> allRates;

  late int _rowsIndex1;
  late int _rowsIndex2;

  void numberTimersToggle1(int index) {
    this._rowsIndex1 = 0;
    this._rowsIndex2 = 0;
    this.engine.numberTimers = index;
  }

  void numberTimersToggle2(int index) {
    this._rowsIndex1 = 0;
    this._rowsIndex2 = 0;
    this.engine.numberTimers = 6 + index;
  }

  void onHelp() async {
    launch('https://github.com/alpiepho/hexcalc_tn/blob/master/README.md');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (!isPortrait) {
      return Scaffold(
        backgroundColor: kInputPageBackgroundColor,
        body: Center(
          child: Container(
            width: kMainContainerWidthPortrait,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Text(
                  "Landscape mode is not supported.",
                  style: kLanscapeWarningTextStyle,
                )
              ],
            ),
          ),
        ),
      );
    }

    if (this.engine.numberTimers >= 0 && this.engine.numberTimers <= 6) {
      this._rowsIndex1 = this.engine.numberTimers + 1 - 1;
      this._rowsIndex2 = 0;
    }
    if (this.engine.numberTimers >= 7 && this.engine.numberTimers <= 12) {
      this._rowsIndex1 = 0;
      this._rowsIndex2 = this.engine.numberTimers + 1 - 6 - 1;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kSettingsModalBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        foregroundColor: Colors.white,
        toolbarHeight: 50,
        titleSpacing: 20,
        title: Text("Settings"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: onDone as void Function()?,
        ),
      ),
      body: Container(
        width: kMainContainerWidthPortrait,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new SizedBox(height: kSettingsSizedBoxHeight),
            new Text(
              "    Number of Timers",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                //fontWeight: FontWeight.w700,
              ),
            ),

            new SizedBox(height: 10),
            ToggleRow(
              minWidth: 50.0,
              index: this._rowsIndex1,
              labels: [' ', '1', '2', '3', '4', '5', '6'],
              onToggle: numberTimersToggle1,
            ),
            new SizedBox(height: 10),
            ToggleRow(
              minWidth: 50.0,
              index: this._rowsIndex2,
              labels: [' ', '7', '8', '9', '10', '11', '12'],
              onToggle: numberTimersToggle2,
            ),

            new SizedBox(height: kSettingsSizedBoxHeight),

            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "Run multiple timers in parallel.",
              textAlign: TextAlign.center,
            ),
            new SizedBox(height: 10),
            new Text(
              "ResetAll to configure number each timer.",
              textAlign: TextAlign.center,
            ),
            new SizedBox(height: 10),
            new Text(
              "ResetN + press timer button to reset that timer.",
              textAlign: TextAlign.center,
            ),
            new SizedBox(height: 10),
            new Text(
              "PauseAll to pause/play all the active timers.",
              textAlign: TextAlign.center,
            ),
                new SizedBox(height: 10),
            new Text(
              "Press timer itself to pause/play only that timer.",
              textAlign: TextAlign.center,
            ),
       
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "UNDER CONSTRUCTION:",
              textAlign: TextAlign.center,
            ),
            new SizedBox(height: 10),
            GestureDetector(
              child: new Text(
                "https://github.com/alpiepho/timers_tn",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onTap: onHelp,
            ),
            new SizedBox(height: kSettingsSizedBoxHeight),
          ],
        ),
      ),
    );
  }
}
