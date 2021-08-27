import 'package:flutter/material.dart';
import 'package:timers_tn/constants.dart';
import 'package:timers_tn/engine.dart';
import 'package:timers_tn/components/timer_enable_card.dart';
import 'package:timers_tn/components/timer_settings_card.dart';
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

  late String _timerStartMs1;
  late String _timerStartMs2;
  late String _timerStartMs3;
  late String _timerStartMs4;
  late String _timerStartMs5;
  late String _timerStartMs6;
  late String _timerStartMs7;
  late String _timerStartMs8;
  late String _timerStartMs9;
  late String _timerStartMs10;
  late String _timerStartMs11;
  late String _timerStartMs12;
  late String _timerStartMsAll;

  void useTimerToggle(int number, int index) {
    this.engine.timerSettings[number - 1].enabled =
        ((index == 1) ? true : false);
    setState(() {
      switch (number) {
        case 1:
          this._useTimerIndex1 = index;
          break;
        case 2:
          this._useTimerIndex2 = index;
          break;
        case 3:
          this._useTimerIndex3 = index;
          break;
        case 4:
          this._useTimerIndex4 = index;
          break;
        case 5:
          this._useTimerIndex5 = index;
          break;
        case 6:
          this._useTimerIndex6 = index;
          break;
        case 7:
          this._useTimerIndex7 = index;
          break;
        case 8:
          this._useTimerIndex8 = index;
          break;
        case 9:
          this._useTimerIndex9 = index;
          break;
        case 10:
          this._useTimerIndex10 = index;
          break;
        case 11:
          this._useTimerIndex11 = index;
          break;
        case 12:
          this._useTimerIndex12 = index;
          break;
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
    this.engine.timerSettings[number - 1].down = ((index == 1) ? true : false);
    setState(() {
      switch (number) {
        case 1:
          this._timerUpDownIndex1 = index;
          break;
        case 2:
          this._timerUpDownIndex2 = index;
          break;
        case 3:
          this._timerUpDownIndex3 = index;
          break;
        case 4:
          this._timerUpDownIndex4 = index;
          break;
        case 5:
          this._timerUpDownIndex5 = index;
          break;
        case 6:
          this._timerUpDownIndex6 = index;
          break;
        case 7:
          this._timerUpDownIndex7 = index;
          break;
        case 8:
          this._timerUpDownIndex8 = index;
          break;
        case 9:
          this._timerUpDownIndex9 = index;
          break;
        case 10:
          this._timerUpDownIndex10 = index;
          break;
        case 11:
          this._timerUpDownIndex11 = index;
          break;
        case 12:
          this._timerUpDownIndex12 = index;
          break;
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
      this.engine.timerSettings[number - 1].startMs = int.parse(value);
    } catch (err) {}
    setState(() {
      switch (number) {
        case 1:
          this._timerStartMs1 = value;
          break;
        case 2:
          this._timerStartMs2 = value;
          break;
        case 3:
          this._timerStartMs3 = value;
          break;
        case 4:
          this._timerStartMs4 = value;
          break;
        case 5:
          this._timerStartMs5 = value;
          break;
        case 6:
          this._timerStartMs6 = value;
          break;
        case 7:
          this._timerStartMs7 = value;
          break;
        case 8:
          this._timerStartMs8 = value;
          break;
        case 9:
          this._timerStartMs9 = value;
          break;
        case 10:
          this._timerStartMs10 = value;
          break;
        case 11:
          this._timerStartMs11 = value;
          break;
        case 12:
          this._timerStartMs12 = value;
          break;
      }
    });
  }

  void timerSoundToggle(int number, int index) {
    this.engine.timerSettings[number - 1].sound = ((index == 1) ? true : false);
    setState(() {
      switch (number) {
        case 1:
          this._timerSoundIndex1 = index;
          break;
        case 2:
          this._timerSoundIndex2 = index;
          break;
        case 3:
          this._timerSoundIndex3 = index;
          break;
        case 4:
          this._timerSoundIndex4 = index;
          break;
        case 5:
          this._timerSoundIndex5 = index;
          break;
        case 6:
          this._timerSoundIndex6 = index;
          break;
        case 7:
          this._timerSoundIndex7 = index;
          break;
        case 8:
          this._timerSoundIndex8 = index;
          break;
        case 9:
          this._timerSoundIndex9 = index;
          break;
        case 10:
          this._timerSoundIndex10 = index;
          break;
        case 11:
          this._timerSoundIndex11 = index;
          break;
        case 12:
          this._timerSoundIndex12 = index;
          break;
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

  void startChangeAll(String text) {
    this.engine.startMsAll = text;
    this._timerStartMsAll = text;
    timerStartChange(1, text);
    timerStartChange(2, text);
    timerStartChange(3, text);
    timerStartChange(4, text);
    timerStartChange(5, text);
    timerStartChange(6, text);
    timerStartChange(7, text);
    timerStartChange(8, text);
    timerStartChange(9, text);
    timerStartChange(10, text);
    timerStartChange(11, text);
    timerStartChange(12, text);
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

    this._timerStartMs1 = this.engine.timerSettings[0].startMs.toString();
    this._timerStartMs2 = this.engine.timerSettings[1].startMs.toString();
    this._timerStartMs3 = this.engine.timerSettings[2].startMs.toString();
    this._timerStartMs4 = this.engine.timerSettings[3].startMs.toString();
    this._timerStartMs5 = this.engine.timerSettings[4].startMs.toString();
    this._timerStartMs6 = this.engine.timerSettings[5].startMs.toString();
    this._timerStartMs7 = this.engine.timerSettings[6].startMs.toString();
    this._timerStartMs8 = this.engine.timerSettings[7].startMs.toString();
    this._timerStartMs9 = this.engine.timerSettings[8].startMs.toString();
    this._timerStartMs10 = this.engine.timerSettings[9].startMs.toString();
    this._timerStartMs11 = this.engine.timerSettings[10].startMs.toString();
    this._timerStartMs12 = this.engine.timerSettings[11].startMs.toString();
    this._timerStartMsAll = this.engine.startMsAll;

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

            new TimerEnableCard(
                number: 1,
                index: this._useTimerIndex1,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(1, index);
                }),
            new TimerEnableCard(
                number: 2,
                index: this._useTimerIndex2,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(2, index);
                }),
            new TimerEnableCard(
                number: 3,
                index: this._useTimerIndex3,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(3, index);
                }),

            new TimerEnableCard(
                number: 4,
                index: this._useTimerIndex4,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(4, index);
                }),
            new TimerEnableCard(
                number: 5,
                index: this._useTimerIndex5,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(5, index);
                }),
            new TimerEnableCard(
                number: 6,
                index: this._useTimerIndex6,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(6, index);
                }),
            new TimerEnableCard(
                number: 7,
                index: this._useTimerIndex7,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(7, index);
                }),
            new TimerEnableCard(
                number: 8,
                index: this._useTimerIndex8,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(8, index);
                }),
            new TimerEnableCard(
                number: 9,
                index: this._useTimerIndex9,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(9, index);
                }),
            new TimerEnableCard(
                number: 10,
                index: this._useTimerIndex10,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(10, index);
                }),
            new TimerEnableCard(
                number: 11,
                index: this._useTimerIndex11,
                label: "",
                toggleFunction: (index) {
                  useTimerToggle(11, index);
                }),
            new TimerEnableCard(
                number: 12,
                label: "",
                index: this._useTimerIndex12,
                toggleFunction: (index) {
                  useTimerToggle(12, index);
                }),
            new SizedBox(height: 10),

            new TimerEnableCard(
                number: -1,
                label: "    Enable All Timers",
                index: this._useTimerIndexAll,
                toggleFunction: useTimerToggleAll),
            new TimerEnableCard(
                number: -1,
                label: "    Count Down All Timers",
                index: this._timerUpDownIndexAll,
                toggleFunction: timerUpDownToggleAll),
            new TimerEnableCard(
                number: -1,
                label: "    Sound on All Timers",
                index: this._timerSoundIndexAll,
                toggleFunction: timerSoundToggleAll),

            new SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
              child: new TextFormField(
                decoration: new InputDecoration.collapsed(
                  hintText: 'milliseconds, will change all when saved', // TODO format as minutes:seconds
                ),
                autofocus: false,
                initialValue: this._timerStartMsAll,
                onChanged: startChangeAll,
                style: kSettingsTextEditStyle,
              ),
            ),
            new SizedBox(height: 10),

            // Timer 1 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 1,
              upDownIndex: this._timerUpDownIndex1,
              startMsString: _timerStartMs1,
              soundIndex: this._timerSoundIndex1,
              upDownToggleFunction: (index) {
                timerUpDownToggle(1, index);
              },
              startChangeFunction: (text) {
                timerStartChange(1, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(1, index);
              },
            ),

            // Timer 2 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 2,
              upDownIndex: this._timerUpDownIndex2,
              startMsString: _timerStartMs2,
              soundIndex: this._timerSoundIndex2,
              upDownToggleFunction: (index) {
                timerUpDownToggle(2, index);
              },
              startChangeFunction: (text) {
                timerStartChange(2, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(2, index);
              },
            ),

            // Timer 3 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 3,
              upDownIndex: this._timerUpDownIndex3,
              startMsString: _timerStartMs3,
              soundIndex: this._timerSoundIndex3,
              upDownToggleFunction: (index) {
                timerUpDownToggle(3, index);
              },
              startChangeFunction: (text) {
                timerStartChange(3, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(3, index);
              },
            ),

            // Timer 4 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 4,
              upDownIndex: this._timerUpDownIndex4,
              startMsString: _timerStartMs4,
              soundIndex: this._timerSoundIndex4,
              upDownToggleFunction: (index) {
                timerUpDownToggle(4, index);
              },
              startChangeFunction: (text) {
                timerStartChange(4, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(4, index);
              },
            ),

            // Timer 5 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 5,
              upDownIndex: this._timerUpDownIndex5,
              startMsString: _timerStartMs5,
              soundIndex: this._timerSoundIndex5,
              upDownToggleFunction: (index) {
                timerUpDownToggle(5, index);
              },
              startChangeFunction: (text) {
                timerStartChange(5, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(5, index);
              },
            ),

            // Timer 6 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 6,
              upDownIndex: this._timerUpDownIndex6,
              startMsString: _timerStartMs6,
              soundIndex: this._timerSoundIndex6,
              upDownToggleFunction: (index) {
                timerUpDownToggle(6, index);
              },
              startChangeFunction: (text) {
                timerStartChange(6, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(6, index);
              },
            ),

            // Timer 7 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 7,
              upDownIndex: this._timerUpDownIndex7,
              startMsString: _timerStartMs7,
              soundIndex: this._timerSoundIndex7,
              upDownToggleFunction: (index) {
                timerUpDownToggle(7, index);
              },
              startChangeFunction: (text) {
                timerStartChange(7, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(7, index);
              },
            ),

            // Timer 8 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 8,
              upDownIndex: this._timerUpDownIndex8,
              startMsString: _timerStartMs8,
              soundIndex: this._timerSoundIndex8,
              upDownToggleFunction: (index) {
                timerUpDownToggle(8, index);
              },
              startChangeFunction: (text) {
                timerStartChange(8, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(8, index);
              },
            ),

            // Timer 9 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 9,
              upDownIndex: this._timerUpDownIndex9,
              startMsString: _timerStartMs9,
              soundIndex: this._timerSoundIndex9,
              upDownToggleFunction: (index) {
                timerUpDownToggle(9, index);
              },
              startChangeFunction: (text) {
                timerStartChange(9, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(9, index);
              },
            ),

            // Timer 10 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 10,
              upDownIndex: this._timerUpDownIndex10,
              startMsString: _timerStartMs10,
              soundIndex: this._timerSoundIndex10,
              upDownToggleFunction: (index) {
                timerUpDownToggle(10, index);
              },
              startChangeFunction: (text) {
                timerStartChange(10, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(10, index);
              },
            ),

            // Timer 11 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 11,
              upDownIndex: this._timerUpDownIndex11,
              startMsString: _timerStartMs11,
              soundIndex: this._timerSoundIndex11,
              upDownToggleFunction: (index) {
                timerUpDownToggle(11, index);
              },
              startChangeFunction: (text) {
                timerStartChange(11, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(11, index);
              },
            ),

            // Timer 12 ///////////////////////////////////////////////////////////////////////////
            new TimerSettingsCard(
              number: 12,
              upDownIndex: this._timerUpDownIndex12,
              startMsString: _timerStartMs12,
              soundIndex: this._timerSoundIndex12,
              upDownToggleFunction: (index) {
                timerUpDownToggle(12, index);
              },
              startChangeFunction: (text) {
                timerStartChange(12, text);
              },
              soundToggleFunction: (index) {
                timerSoundToggle(12, index);
              },
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
