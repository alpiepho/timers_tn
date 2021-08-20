import 'package:flutter/material.dart';
import 'package:timers_tn/components/timer_button.dart';
import 'package:timers_tn/components/settings_modal.dart';
import 'package:timers_tn/constants.dart';
import 'package:timers_tn/engine.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  Engine _engine = Engine();

  String _label1 = "00:00.00";
  Timer _timer1 = Timer(Duration(seconds: 10), () => {});
  bool _timerUp1 = false;
  int _timerStartMs1 = 10000;
  Duration _timerDuration1 = Duration(milliseconds: 0);
  TextStyle _timerStyle1 = kLabelTextStyle;

  void _loadEngine() async {
    final prefs = await SharedPreferences.getInstance();
    var packed = prefs.getString('engine') ?? "";
    _engine.unpack(packed);
    _fromEngine();
  }

  void _saveEngine() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('engine', _engine.pack());
  }

  void _fromEngine() async {
    setState(() {
      _saveEngine();
    });
  }

  void _onDone() async {
    this._engine.adjustTimers();  // force update
    _fromEngine();
    Navigator.of(context).pop();
  }

  void _handleTick10ms() {
    bool changed = false;
    TextStyle newStyle = kLabelTextStyle;
    if (_timerUp1) {
      _timerDuration1 += Duration(milliseconds: 10);
      changed = true;
    }
    if (!_timerUp1 && _timerDuration1.inMilliseconds >= 10) {
      _timerDuration1 -= Duration(milliseconds: 10);
      changed = true;

      if (_timerDuration1.inMilliseconds > 8000 && _timerDuration1.inMilliseconds <= 10000) {
        newStyle = newStyle.copyWith(color: kGreenColor);
      }
      if (_timerDuration1.inMilliseconds > 5000 && _timerDuration1.inMilliseconds <= 8000) {
        newStyle = newStyle.copyWith(color: kYellowColor);
      }
      if (_timerDuration1.inMilliseconds > 2000 && _timerDuration1.inMilliseconds <= 5000) {
        newStyle = newStyle.copyWith(color: kOrangeColor);
      }
      if (_timerDuration1.inMilliseconds <= 2000) {
        newStyle = newStyle.copyWith(color: kRedColor);
      }
    }
    if (changed) {
      var m = _timerDuration1.inMinutes.remainder(60).toString().padLeft(2, '0');
      var s = _timerDuration1.inSeconds.remainder(60).toString().padLeft(2, '0');
      var hs = (_timerDuration1.inMilliseconds.remainder(1000) ~/10).toString().padLeft(2, '0');

      setState(() {
        _label1 = "$m:$s.$hs";
        _timerStyle1 = newStyle;
      });

    }
  }

  void _notifyEngine(int x, int y) async {
    if(this._engine.processKey(x, y)) {
      // only some keys should cause page to re-build
      _fromEngine();
    }

    switch (this._engine.getKeyType(x, y)) {
      case KeyType.pauseAll:
        if (_timer1.isActive) {
          _timer1.cancel();
          if (_timerUp1) {
            _timerDuration1 = Duration(milliseconds: 0);
          } else {
            _timerDuration1 = Duration(milliseconds: _timerStartMs1);
          }
          var m = _timerDuration1.inMinutes.remainder(60).toString().padLeft(2, '0');
          var s = _timerDuration1.inSeconds.remainder(60).toString().padLeft(2, '0');
          var hs = (_timerDuration1.inMilliseconds.remainder(1000) ~/10).toString().padLeft(2, '0');
          setState(() {
            _label1 = "$m:$s.$hs";
            _timerStyle1 = kLabelTextStyle;
          });
        }
        else {
          _timer1 = Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
            _handleTick10ms();
          });
        }
        break;
      default: break;
    }
  }

  @override
  initState() {
    super.initState();
    _loadEngine();
    // Timer.periodic(Duration(milliseconds: 10), (Timer timer) {
    //   if (!_isRunning) {
    //     timer.cancel();
    //   }
    //   _handleTick10ms();
    // });
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

    var colWidgets = <Widget>[];

    var deviceSize = MediaQuery.of(context).size;
    var mainColumnHeightPortrait = kMainColumnHeightPortrait;
    if (deviceSize.height < 700) {
      mainColumnHeightPortrait = kMainColumnHeightPortrait2;
    }

    colWidgets.add(new SizedBox(height: 10));

    colWidgets.add(Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(
            "Multiple Timers TN", 
            style: kLabelHeaderTextStyle
          ),
        ],
      ),
    ));

    colWidgets.add(new SizedBox(height: 10));

    // build the buttons
    int count = 0;
    for (var i = 0; i < this._engine.grid.length; i++) {
      var rowWidgets = <Widget>[];
      for (var j = 0; j < this._engine.grid[0].length; j++) {
        var label = this._engine.getLabel(i, j);
        var style = kLabelTextStyle;
        switch (count) {
          case 3: label = _label1; style = _timerStyle1; break;
        }
        var disabled = this._engine.grid[i][j].disabled;
        if (disabled) {
          style = style.copyWith(color: kLightColor);
        }
        var background = this._engine.grid[i][j].background;
        var gradient = this._engine.grid[i][j].gradient;
        var flex = this._engine.grid[i][j].flex;
        // build onpress function that calls engine with closure
        var onPress = () {
          _notifyEngine(i, j);
        };
        if (label == "?") {
          // replace press onPress with settings page call
          onPress = () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext bc) {
                return SettingsModal(
                  context,
                  this._engine,
                  _onDone,
                );
              },
              isScrollControlled: true,
            );
          };
        }
        if (flex > 0) {
          rowWidgets.add(
            new Expanded(
              child: TimerButton(
                onPress: onPress,
                color: background,
                margin: EdgeInsets.fromLTRB(0, 0, 2, 2),
                portrait: true,
                gradient: gradient,
                disabled: disabled,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      label,
                      style: style,
                    ),
                  ],
                ),
              ),
              flex: flex,
            ),
          );
        }
        count += 1;
      }
      var row = new Row(children: rowWidgets);
      var container = new Container(
        height: (this._engine.grid[i][0].halfHeight
            ? mainColumnHeightPortrait / 2
            : mainColumnHeightPortrait),
        child: row,
      );
      colWidgets.add(container);
    }

    return Scaffold(
      backgroundColor: kInputPageBackgroundColor,
      body: Center(
        child: Container(
          width: kMainContainerWidthPortrait,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: colWidgets,
          ),
        ),
      ),
    );
  }
}
