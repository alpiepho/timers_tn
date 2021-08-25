import 'package:flutter/material.dart';
import 'package:timers_tn/constants.dart';
import 'package:timers_tn/engine.dart';
import 'package:timers_tn/components/toggle_choice.dart';
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

    this._useTimerIndex1 = 0;
    this._useTimerIndex2 = 0;
    this._useTimerIndex3 = 0;
    this._useTimerIndex4 = 0;
    this._useTimerIndex5 = 0;
    this._useTimerIndex6 = 0;
    this._useTimerIndex7 = 0;
    this._useTimerIndex8 = 0;
    this._useTimerIndex9 = 0;
    this._useTimerIndex10 = 0;
    this._useTimerIndex11 = 0;
    this._useTimerIndex12 = 0;
    this._useTimerIndexAll = 0;

    this._timerUpDownIndex1 = 0;
    this._timerUpDownIndex2 = 0;
    this._timerUpDownIndex3 = 0;
    this._timerUpDownIndex4 = 0;
    this._timerUpDownIndex5 = 0;
    this._timerUpDownIndex6 = 0;
    this._timerUpDownIndex7 = 0;
    this._timerUpDownIndex8 = 0;
    this._timerUpDownIndex9 = 0;
    this._timerUpDownIndex10 = 0;
    this._timerUpDownIndex11 = 0;
    this._timerUpDownIndex12 = 0;

    this._timerSoundIndex1 = 0;
    this._timerSoundIndex2 = 0;
    this._timerSoundIndex3 = 0;
    this._timerSoundIndex4 = 0;
    this._timerSoundIndex5 = 0;
    this._timerSoundIndex6 = 0;
    this._timerSoundIndex7 = 0;
    this._timerSoundIndex8 = 0;
    this._timerSoundIndex9 = 0;
    this._timerSoundIndex10 = 0;
    this._timerSoundIndex11 = 0;
    this._timerSoundIndex12 = 0;
  }

  late BuildContext context;
  late Engine engine;
  late Function onDone;

  late var selectedRate;
  late List<String> allRates;

  late int _useTimerIndex1;
  late int _useTimerIndex2;
  late int _useTimerIndex3;
  late int _useTimerIndex4;
  late int _useTimerIndex5;
  late int _useTimerIndex6;
  late int _useTimerIndex7;
  late int _useTimerIndex8;
  late int _useTimerIndex9;
  late int _useTimerIndex10;
  late int _useTimerIndex11;
  late int _useTimerIndex12;
  late int _useTimerIndexAll;

  late int _timerUpDownIndex1;
  late int _timerUpDownIndex2;
  late int _timerUpDownIndex3;
  late int _timerUpDownIndex4;
  late int _timerUpDownIndex5;
  late int _timerUpDownIndex6;
  late int _timerUpDownIndex7;
  late int _timerUpDownIndex8;
  late int _timerUpDownIndex9;
  late int _timerUpDownIndex10;
  late int _timerUpDownIndex11;
  late int _timerUpDownIndex12;
  late int _timerUpDownIndexAll;

  late int _timerSoundIndex1;
  late int _timerSoundIndex2;
  late int _timerSoundIndex3;
  late int _timerSoundIndex4;
  late int _timerSoundIndex5;
  late int _timerSoundIndex6;
  late int _timerSoundIndex7;
  late int _timerSoundIndex8;
  late int _timerSoundIndex9;
  late int _timerSoundIndex10;
  late int _timerSoundIndex11;
  late int _timerSoundIndex12;
  late int _timerSoundIndexAll;

  void useTimerToggle(int number, int index) {
    this.engine.timerSettings[number-1].enabled = ((index == 1) ? true : false);
    setState(() {
      switch (number) {
        case 1: this._useTimerIndex1 = index; break;
        case 2: this._useTimerIndex2 = index; break;
        case 3: this._useTimerIndex3 = index; break;
        case 4: this._useTimerIndex4 = index; break;
        case 5: this._useTimerIndex5 = index; break;
        case 6: this._useTimerIndex6 = index; break;
        case 7: this._useTimerIndex7 = index; break;
        case 8: this._useTimerIndex8 = index; break;
        case 9: this._useTimerIndex9 = index; break;
        case 10: this._useTimerIndex10 = index; break;
        case 11: this._useTimerIndex11 = index; break;
        case 12: this._useTimerIndex12 = index; break;
      }     
    });
  }

  void useTimerToggleAll(int index) {
    this.engine.useTimerAll = ((index == 1) ? true : false);
    this._useTimerIndexAll = index;
    useTimerToggle(1, index);
    useTimerToggle(2, index);
    useTimerToggle(3, index);
    useTimerToggle(4, index);
    useTimerToggle(5, index);
    useTimerToggle(6, index);
    useTimerToggle(7, index);
    useTimerToggle(8, index);
    useTimerToggle(9, index);
    useTimerToggle(10, index);
    useTimerToggle(11, index);
    useTimerToggle(12, index);
  }

  void timerUpDownToggle(int number, int index) {
    this.engine.timerSettings[number-1].down = ((index == 1) ? true : false);
    setState(() {
      switch (number) {
        case 1: this._timerUpDownIndex1 = index; break;
        case 2: this._timerUpDownIndex2 = index; break;
        case 3: this._timerUpDownIndex3 = index; break;
        case 4: this._timerUpDownIndex4 = index; break;
        case 5: this._timerUpDownIndex5 = index; break;
        case 6: this._timerUpDownIndex6 = index; break;
        case 7: this._timerUpDownIndex7 = index; break;
        case 8: this._timerUpDownIndex8 = index; break;
        case 9: this._timerUpDownIndex9 = index; break;
        case 10: this._timerUpDownIndex10 = index; break;
        case 11: this._timerUpDownIndex11 = index; break;
        case 12: this._timerUpDownIndex12 = index; break;
      }     
    });
  }

  void timerUpDownToggleAll(int index) {
    this.engine.countDownAll = ((index == 1) ? true : false);
    this._timerUpDownIndexAll = index;
    timerUpDownToggle(1, index);
    timerUpDownToggle(2, index);
    timerUpDownToggle(3, index);
    timerUpDownToggle(4, index);
    timerUpDownToggle(5, index);
    timerUpDownToggle(6, index);
    timerUpDownToggle(7, index);
    timerUpDownToggle(8, index);
    timerUpDownToggle(9, index);
    timerUpDownToggle(10, index);
    timerUpDownToggle(11, index);
    timerUpDownToggle(12, index);
  }

  void timerStartChange(int number, String value) {
    try {
        this.engine.timerSettings[number-1].startMs = int.parse(value);
    }
    catch (err) {}
  }

  void timerSoundToggle(int number, int index) {
    this.engine.timerSettings[number-1].sound = ((index == 1) ? true : false);
    setState(() {
      switch (number) {
        case 1: this._timerSoundIndex1 = index; break;
        case 2: this._timerSoundIndex2 = index; break;
        case 3: this._timerSoundIndex3 = index; break;
        case 4: this._timerSoundIndex4 = index; break;
        case 5: this._timerSoundIndex5 = index; break;
        case 6: this._timerSoundIndex6 = index; break;
        case 7: this._timerSoundIndex7 = index; break;
        case 8: this._timerSoundIndex8 = index; break;
        case 9: this._timerSoundIndex9 = index; break;
        case 10: this._timerSoundIndex10 = index; break;
        case 11: this._timerSoundIndex11 = index; break;
        case 12: this._timerSoundIndex12 = index; break;
      }     
    });
  }

  void timerSoundToggleAll(int index) {
    this.engine.soundAll = ((index == 1) ? true : false);
    this._timerSoundIndexAll = index;
    timerSoundToggle(1, index);
    timerSoundToggle(2, index);
    timerSoundToggle(3, index);
    timerSoundToggle(4, index);
    timerSoundToggle(5, index);
    timerSoundToggle(6, index);
    timerSoundToggle(7, index);
    timerSoundToggle(8, index);
    timerSoundToggle(9, index);
    timerSoundToggle(10, index);
    timerSoundToggle(11, index);
    timerSoundToggle(12, index);
  }

  void onHelp() async {
    launch('https://github.com/alpiepho/timers_tn/blob/master/README.md');
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

    this._useTimerIndex1 = (this.engine.timerSettings[0].enabled ? 1 : 0);
    this._useTimerIndex2 = (this.engine.timerSettings[1].enabled ? 1 : 0);
    this._useTimerIndex3 = (this.engine.timerSettings[2].enabled ? 1 : 0);
    this._useTimerIndex4 = (this.engine.timerSettings[3].enabled ? 1 : 0);
    this._useTimerIndex5 = (this.engine.timerSettings[4].enabled ? 1 : 0);
    this._useTimerIndex6 = (this.engine.timerSettings[5].enabled ? 1 : 0);
    this._useTimerIndex7 = (this.engine.timerSettings[6].enabled ? 1 : 0);
    this._useTimerIndex8 = (this.engine.timerSettings[7].enabled ? 1 : 0);
    this._useTimerIndex9 = (this.engine.timerSettings[8].enabled ? 1 : 0);
    this._useTimerIndex10 = (this.engine.timerSettings[9].enabled ? 1 : 0);
    this._useTimerIndex11 = (this.engine.timerSettings[10].enabled ? 1 : 0);
    this._useTimerIndex12 = (this.engine.timerSettings[11].enabled ? 1 : 0);
    this._useTimerIndexAll = (this.engine.useTimerAll ? 1 : 0);

    this._timerUpDownIndex1 = (this.engine.timerSettings[0].down ? 1 : 0);
    this._timerUpDownIndex2 = (this.engine.timerSettings[1].down ? 1 : 0);
    this._timerUpDownIndex3 = (this.engine.timerSettings[2].down ? 1 : 0);
    this._timerUpDownIndex4 = (this.engine.timerSettings[3].down ? 1 : 0);
    this._timerUpDownIndex5 = (this.engine.timerSettings[4].down ? 1 : 0);
    this._timerUpDownIndex6 = (this.engine.timerSettings[5].down ? 1 : 0);
    this._timerUpDownIndex7 = (this.engine.timerSettings[6].down ? 1 : 0);
    this._timerUpDownIndex8 = (this.engine.timerSettings[7].down ? 1 : 0);
    this._timerUpDownIndex9 = (this.engine.timerSettings[8].down ? 1 : 0);
    this._timerUpDownIndex10 = (this.engine.timerSettings[9].down ? 1 : 0);
    this._timerUpDownIndex11 = (this.engine.timerSettings[10].down ? 1 : 0);
    this._timerUpDownIndex12 = (this.engine.timerSettings[11].down ? 1 : 0);
    this._timerUpDownIndexAll = (this.engine.countDownAll ? 1 : 0);

    this._timerSoundIndex1 = (this.engine.timerSettings[0].sound ? 1 : 0);
    this._timerSoundIndex2 = (this.engine.timerSettings[1].sound ? 1 : 0);
    this._timerSoundIndex3 = (this.engine.timerSettings[2].sound ? 1 : 0);
    this._timerSoundIndex4 = (this.engine.timerSettings[3].sound ? 1 : 0);
    this._timerSoundIndex5 = (this.engine.timerSettings[4].sound ? 1 : 0);
    this._timerSoundIndex6 = (this.engine.timerSettings[5].sound ? 1 : 0);
    this._timerSoundIndex7 = (this.engine.timerSettings[6].sound ? 1 : 0);
    this._timerSoundIndex8 = (this.engine.timerSettings[7].sound ? 1 : 0);
    this._timerSoundIndex9 = (this.engine.timerSettings[8].sound ? 1 : 0);
    this._timerSoundIndex10 = (this.engine.timerSettings[9].sound ? 1 : 0);
    this._timerSoundIndex11 = (this.engine.timerSettings[10].sound ? 1 : 0);
    this._timerSoundIndex12 = (this.engine.timerSettings[11].sound ? 1 : 0);
    this._timerSoundIndexAll = (this.engine.soundAll ? 1 : 0);

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
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            new SizedBox(height: kSettingsSizedBoxHeight),
            new Text(
              "    Enable Timers",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),

            // new SizedBox(height: 10),

            //new SizedBox(height: kSettingsSizedBoxHeight),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex1,
              label: "    Timer 1",
              onToggle: (index) { useTimerToggle(1, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex2,
              label: "    Timer 2",
              onToggle: (index) { useTimerToggle(2, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex3,
              label: "    Timer 3",
              onToggle: (index) { useTimerToggle(3, index); },
            ),

            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex4,
              label: "    Timer 4",
              onToggle: (index) { useTimerToggle(4, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex5,
              label: "    Timer 5",
              onToggle: (index) { useTimerToggle(5, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex6,
              label: "    Timer 6",
              onToggle: (index) { useTimerToggle(6, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex7,
              label: "    Timer 7",
              onToggle: (index) { useTimerToggle(7, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex8,
              label: "    Timer 8",
              onToggle: (index) { useTimerToggle(8, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex9,
              label: "    Timer 9",
              onToggle: (index) { useTimerToggle(9, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex10,
              label: "    Timer 10",
              onToggle: (index) { useTimerToggle(10, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex11,
              label: "    Timer 11",
              onToggle: (index) { useTimerToggle(11, index); },
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._useTimerIndex12,
              label: "    Timer 12",
              onToggle: (index) { useTimerToggle(12, index); },
            ),
            new SizedBox(height: 20),
            ToggleChoice(
              index: this._useTimerIndexAll,
              label: "    Enable All Timers",
              onToggle: useTimerToggleAll,
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndexAll,
              label: "    Count Down All Timers",
              onToggle: timerUpDownToggleAll,
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndexAll,
              label: "    Sound on All Timers",
              onToggle: timerSoundToggleAll,
            ),


            // Timer 1 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 1",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex1,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(1, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[0].startMs.toString(),
                  onChanged: (text) { timerStartChange(1, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex1,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(1, index); },
            ),

            // Timer 2 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 2",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex2,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(2, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[1].startMs.toString(),
                  onChanged: (text) { timerStartChange(2, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex2,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(2, index); },
            ),

            // Timer 3 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 3",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex3,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(3, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[2].startMs.toString(),
                  onChanged: (text) { timerStartChange(3, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex3,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(3, index); },
            ),

            // Timer 4 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 4",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex4,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(4, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[3].startMs.toString(),
                  onChanged: (text) { timerStartChange(4, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex4,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(4, index); },
            ),

            // Timer 5 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 5",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex5,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(5, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[4].startMs.toString(),
                  onChanged: (text) { timerStartChange(5, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex5,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(5, index); },
            ),

            // Timer 6 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 6",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex6,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(6, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[5].startMs.toString(),
                  onChanged: (text) { timerStartChange(6, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex6,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(6, index); },
            ),

            // Timer 7 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 7",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex7,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(7, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[6].startMs.toString(),
                  onChanged: (text) { timerStartChange(7, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex7,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(7, index); },
            ),

            // Timer 8 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 8",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex8,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(8, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[7].startMs.toString(),
                  onChanged: (text) { timerStartChange(8, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex8,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(8, index); },
            ),

            // Timer 9 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 9",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex9,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(9, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[8].startMs.toString(),
                  onChanged: (text) { timerStartChange(9, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex9,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(9, index); },
            ),

            // Timer 10 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 10",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex10,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(10, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[9].startMs.toString(),
                  onChanged: (text) { timerStartChange(10, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex10,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(10, index); },
            ),

            // Timer 11 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 11",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex11,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(11, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[10].startMs.toString(),
                  onChanged: (text) { timerStartChange(11, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex11,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(11, index); },
            ),

            // Timer 12 ///////////////////////////////////////////////////////////////////////////
            Divider(
              height: 20.0,
              thickness: 2.0,
            ),
            new Text(
              "    Timer 12",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerUpDownIndex12,
              label: "    count down",
              onToggle: (index) { timerUpDownToggle(12, index); },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                  decoration: new InputDecoration.collapsed(
                      hintText: 'milliseconds', // TODO format as minutes:seconds
                  ),
                  autofocus: false,
                  initialValue: this.engine.timerSettings[11].startMs.toString(),
                  onChanged: (text) { timerStartChange(12, text); },
                  style: kSettingsTextEditStyle,
                ),
            ),
            new SizedBox(height: 10),
            ToggleChoice(
              index: this._timerSoundIndex12,
              label: "    sound",
              onToggle: (index) { timerSoundToggle(12, index); },
            ),





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
            new SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
