import 'package:flutter/material.dart';
import 'package:timers_tn/constants.dart';
import 'package:timers_tn/engine.dart';
//import 'package:timers_tn/components/toggle_choice.dart';
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
    //this._keyClickIndex = 0;
    //this._soundsIndex = 0;
    // this._backspaceIndex = 0;
    // this._dozenalIndex = 0;
    //this._precedenceIndex = 0;
    // this._rpnIndex = 0;
    // this._floatingIndex = 0;
    this._rowsIndex1 = 0;
    this._rowsIndex2 = 0;
  }

  late BuildContext context;
  late Engine engine;
  late Function onDone;
  //late int _keyClickIndex;
  //late int _soundsIndex;
  // late int _backspaceIndex;
  // late int _dozenalIndex;
  //late int _precedenceIndex;
  // late int _rpnIndex;
  // late int _floatingIndex;

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

  // void showWarningDialog(String message, int popCount) {
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('WARNING'),
  //         content: new Text(message),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Ok'),
  //             onPressed: () {
  //               this.engine.numberBits = 32;
  //               for (int i = 0; i < popCount; i++) {
  //                 Navigator.of(context).pop();
  //               }
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void showWarningDialogAndResponse(String message, int popCount, Function? onPress) {
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: false, // user must tap button!
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: const Text('WARNING'),
  //         content: new Text(message),
  //         actions: <Widget>[
  //           TextButton(
  //             child: const Text('Cancel'),
  //             onPressed: () {
  //               this.engine.numberBits = 32;
  //               for (int i = 0; i < popCount; i++) {
  //                 Navigator.of(context).pop();
  //               }
  //               onPress!(false);
  //             },
  //           ),
  //           TextButton(
  //             child: const Text('Ok'),
  //             onPressed: () {
  //               this.engine.numberBits = 32;
  //               for (int i = 0; i < popCount; i++) {
  //                 Navigator.of(context).pop();
  //               }
  //               onPress!(true);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void onBitsToggle(int index) {
  //   switch (index) {
  //     case 0:
  //       this.engine.numberBits = 8;
  //       break;
  //     case 1:
  //       this.engine.numberBits = 12;
  //       break;
  //     case 2:
  //       this.engine.numberBits = 16;
  //       break;
  //     case 3:
  //       this.engine.numberBits = 24;
  //       break;
  //     case 4:
  //       this.engine.numberBits = 32;
  //       break;
  //     case 5:
  //       this.engine.numberBits = 48;
  //       break;
  //     default:
  //       showWarningDialog("64 bit not supported, will revert to 32", 2);
  //       break;
  //   }
  // }

  // void onPointsToggle(int index) {
  //   this.engine.decimalPoints = index;
  // }

  // void onFunctionsToggle(int index) {
  //   if (index == 0 && this.engine.floatingPoint) {
  //     showWarningDialog("Please disable floating point", 1);
  //     return;
  //   }
  //   if (index > 0 && !this.engine.floatingPoint) {
  //     showWarningDialog("Please enable floating point", 1);
  //     return;
  //   }
  //   this.engine.functionsIndex = index;
  //   // if (index == 1) showWarningDialog("Under construction", 1);
  //   // if (index == 2) showWarningDialog("Under construction", 1);
  //   // if (index == 3) showWarningDialog("Under construction", 1);
  //   // if (index == 4) showWarningDialog("Under construction", 1);
  //   // if (index == 5) showWarningDialog("Under construction", 1);
  // }

  // void onSignedToggle(int index) {
  //   this.engine.numberSigned = (index == 1);
  // }

  // void keyClickToggle(int index) {
  //  this.engine.keyClick = (index == 1);
  // }

  // void soundToggle(int index) {
  //  this.engine.sounds = (index == 1);
  //   setState(() {
  //     this._soundsIndex = index;
  //   });
  // }

  // void backspaceToggle(int index) {
  //   this.engine.backspaceCE = (index == 1);
  //   setState(() {
  //     this._backspaceIndex = index;
  //   });
  // }

  // void dozenalToggle(int index) {
  //   this.engine.dozonal = (index == 1);
  //   setState(() {
  //     this._dozenalIndex = index;
  //   });
  // }

  // void precedenceToggle(int index) {
  //   this.engine.operatorPrec = (index == 1);
  //   setState(() {
  //     this._precedenceIndex = index;
  //   });
  //   if (index == 1) {
  //     showWarningDialog("Precidence is not supported yet, ignored", 1);
  //   }
  // }

  // void rpnToggle(int index) {
  //   this.engine.rpn = (index == 1);
  //   this.engine.resultLines = ((index == 1) ? 4 : 1);
  //   setState(() {
  //     this._rpnIndex = index;
  //   });
  // }

  // void floatingToggle(int index) {
  //   showWarningDialogAndResponse(
  //     "Must clear stack, continue?", 
  //     1,
  //     (bool choice) {
  //       if (choice) {
  //         this.engine.floatingPoint = ((index == 1) ? true : false);
  //         setState(() {
  //           this._floatingIndex = index;
  //         });
  //         if (this.engine.floatingPoint) {
  //           this.engine.mode = "DEC";
  //           this.engine.numberSigned = true;
  //         }
  //         else {
  //           this.engine.functionsIndex = 0;
  //         }
  //         //this.engine.clearStack();
  //       }
  //     }
  //   );
  // }

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

    // var bitIndex = 4;
    // switch (this.engine.numberBits) {
    //   case 8:
    //     bitIndex = 0;
    //     break;
    //   case 12:
    //     bitIndex = 1;
    //     break;
    //   case 16:
    //     bitIndex = 2;
    //     break;
    //   case 24:
    //     bitIndex = 3;
    //     break;
    //   case 32:
    //     bitIndex = 4;
    //     break;
    //   case 48:
    //     bitIndex = 5;
    //     break;
    //   case 64:
    //     bitIndex = 6;
    //     break;
    // }

    // var pointsIndex = this.engine.decimalPoints;
    // var functionsIndex = this.engine.functionsIndex;

    // var signedIndex = (this.engine.numberSigned ? 1 : 0);
    // // this._keyClickIndex = (this.engine.keyClick ? 1 : 0);
    // // this._soundsIndex = (this.engine.sounds ? 1 : 0);
    // this._backspaceIndex = (this.engine.backspaceCE ? 1 : 0);
    // this._dozenalIndex = (this.engine.dozonal ? 1 : 0);
    // // this._precedenceIndex = (this.engine.operatorPrec ? 1 : 0);
    // this._rpnIndex = (this.engine.rpn ? 1 : 0);
    // this._floatingIndex = (this.engine.floatingPoint ? 1 : 0);

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
            // ToggleChoice(
            //   index: this._rpnIndex,
            //   label: "    Post Fix (RPN)",
            //   onToggle: rpnToggle,
            // ),

            // new SizedBox(height: 10),
            // ToggleChoice(
            //   index: this._floatingIndex,
            //   label: "    Floating Point",
            //   onToggle: floatingToggle,
            // ),

            // //new SizedBox(height: kSettingsSizedBoxHeight),
            // new Text(
            //   "    Decimal Points",
            //   textAlign: TextAlign.left,
            //   style: TextStyle(
            //     fontSize: 16,
            //     //fontWeight: FontWeight.w700,
            //   ),
            // ),

            // new SizedBox(height: 10),
            // ToggleRow(
            //   minWidth: 50.0,
            //   index: pointsIndex,
            //   labels: ['0', '1', '2', '3', '4', '5', '6'],
            //   onToggle: onPointsToggle,
            // ),
            // new SizedBox(height: 10),

            // //new SizedBox(height: kSettingsSizedBoxHeight),
            // new Text(
            //   "    Functions",
            //   textAlign: TextAlign.left,
            //   style: TextStyle(
            //     fontSize: 16,
            //     //fontWeight: FontWeight.w700,
            //   ),
            // ),
            // new SizedBox(height: 10),
            // ToggleRow(
            //   minWidth: 50.0,
            //   index: functionsIndex,
            //   labels: ['SHL...', '1/x...', 'sin...', 'rad...', 'e...', 'asin...'],
            //   onToggle: onFunctionsToggle,
            // ),
            // new SizedBox(height: 10),

            // Divider(
            //   height: 10.0,
            //   thickness: 2.0,
            // ),

            // new SizedBox(height: kSettingsSizedBoxHeight),
            // new Text(
            //   "    Number of Bits",
            //   textAlign: TextAlign.left,
            //   style: TextStyle(
            //     fontSize: 16,
            //     //fontWeight: FontWeight.w700,
            //   ),
            // ),

            // new SizedBox(height: 10),
            // ToggleRow(
            //   minWidth: 50.0,
            //   index: bitIndex,
            //   labels: ['8', '12', '16', '24', '32', '48', '64'],
            //   onToggle: onBitsToggle,
            // ),

            // new SizedBox(height: kSettingsSizedBoxHeight),
            // ToggleRow(
            //   minWidth: 100.0,
            //   index: signedIndex,
            //   labels: ['UnSigned', 'Signed'],
            //   onToggle: onSignedToggle,
            // ),

            // new SizedBox(height: kSettingsSizedBoxHeight),
            // // new SizedBox(height: 10),
            // // ToggleChoice(
            // //   index: this._keyClickIndex,
            // //   label: "    Key Click",
            // //   onToggle: keyClickToggle,
            // // ),

            // // new SizedBox(height: 10),
            // // ToggleChoice(
            // //   index: this._soundsIndex,
            // //   label: "    Sounds",
            // //   onToggle: soundToggle,
            // // ),

            // new SizedBox(height: 10),
            // ToggleChoice(
            //   index: this._backspaceIndex,
            //   label: "    CE as Backspace",
            //   onToggle: backspaceToggle,
            // ),

            // new SizedBox(height: 10),
            // ToggleChoice(
            //   index: this._dozenalIndex,
            //   label: "    Dozenal\n    (Base 12 vs 16)",
            //   onToggle: dozenalToggle,
            // ),

            // // new SizedBox(height: 10),
            // // ToggleChoice(
            // //   index: this._precedenceIndex,
            // //   label: "    Operator\n    Precedence",
            // //   onToggle: precedenceToggle,
            // // ),
            // // Divider(),
            // // new Text(
            // //   "If operator precedence is enabled",
            // //   textAlign: TextAlign.center,
            // // ),
            // // new SizedBox(height: 10),
            // // new Text(
            // //   "1 + 2 x 3 = 7 (instead of 9)",
            // //   textAlign: TextAlign.center,
            // // ),

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
