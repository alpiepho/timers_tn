import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timers_tn/screens/calculator_page.dart';

void main() {
  //runApp(Calculator());

  // We need to call it manually,
  // because we going to call configurations
  // before the runApp() call
  WidgetsFlutterBinding.ensureInitialized();

  // Hide status bar
  SystemChrome.setEnabledSystemUIOverlays([]);

  // Than we setup preferred orientations,
  // and only after it finished we run our app
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(Timers()));
}

class Timers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Timers TN",
      home: TimersPage(),
    );
  }
}
