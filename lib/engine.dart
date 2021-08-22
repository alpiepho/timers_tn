import 'package:flutter/material.dart';
import 'package:timers_tn/constants.dart';

enum KeyType {
  pauseAll,
  playAll,
  settings,
  timer1,
  timer2,
  timer3,
  timer4,
  timer5,
  timer6,
  timer7,
  timer8,
  timer9,
  timer10,
  timer11,
  timer12,
  resetN,
  resetAll,
  none
}
class Cell {
  String label;
  bool halfHeight;
  Color background;
  bool gradient;
  int flex;
  bool disabled;
  bool active;

  Cell({
    this.label = '',
    this.halfHeight = false,
    this.background = Colors.grey,
    this.gradient = true,
    this.flex = 1,
    this.disabled = false,
    this.active = false,
  });
}

// class Timer():
//     delta = DELTA
//     start = 0
//     current = 0
//     formatted = "0:00.0"
//     running = False
//     paused = False
//     color = GREEN
//     color_dim = GREEN_DIM
//     current_yellow = 0
//     current_orange = 0
//     current_red = 0
//     blink = BLINK_BLINK
//     blink_on = False
//     blink_last = 0
//     sound = False
//     pressed_last = 0

// class TimerStruct {
//   String label;
//   int start;
//   bool down;
//   int current;

//   TimerStruct({
//     this.label = '',
//     this.start = 0,
//     this.down = false,
//     this.current = 0,
//   });
// }

class Engine {
  var grid = List.generate(6, (i) => List.generate(3, (index) => Cell()),
      growable: false);
  int pauseAllX = -1;
  int pauseAllY = -1;
  int playAllX = -1;
  int playAllY = -1;
  int settingsX = -1;
  int settingsY = -1;
 
  int timer1X = -1;
  int timer1Y = -1;
  int timer2X = -1;
  int timer2Y = -1;
  int timer3X = -1;
  int timer3Y = -1;
  int timer4X = -1;
  int timer4Y = -1;
  int timer5X = -1;
  int timer5Y = -1;
  int timer6X = -1;
  int timer6Y = -1;
  int timer7X = -1;
  int timer7Y = -1;
  int timer8X = -1;
  int timer8Y = -1;
  int timer9X = -1;
  int timer9Y = -1;
  int timer10X = -1;
  int timer10Y = -1;
  int timer11X = -1;
  int timer11Y = -1;
  int timer12X = -1;
  int timer12Y = -1;

  int resetNX = -1;
  int restNY = -1;
  int resetAllX = -1;
  int resetAllY = -1;

  var numberTimers = 1;
  var useTimer = List.generate(12, (index) => false);


  Engine() {
    int row = 0;
    int col = 0;
    grid[row][col] = new Cell(label: "PauseAll");
    pauseAllX = row;
    pauseAllY = col;
    col++;
    grid[row][col] = new Cell(label: "PlayAll");
    playAllX = row;
    playAllY = col;
    col++;
    grid[row][col] = new Cell(label: "?");
    settingsX = row;
    settingsY = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00");
    timer1X = row;
    timer1Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer2X = row;
    timer2Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer3X = row;
    timer3Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00");
    timer4X = row;
    timer4Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer5X = row;
    timer5Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer6X = row;
    timer6Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00");
    timer7X = row;
    timer7Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer8X = row;
    timer8Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer9X = row;
    timer9Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00");
    timer10X = row;
    timer10Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer11X = row;
    timer11Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00");
    timer12X = row;
    timer12Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "ResetN");
    resetNX = row;
    restNY = col;
    col++;
    grid[row][col] = new Cell(label: "");
    col++;
    grid[row][col] = new Cell(label: "ResetAll");
    resetAllX = row;
    resetAllY = col;
    col++;
    row++;
    for (int i = 0; i < useTimer.length; i++) {
      useTimer[i] = false;
    }
    adjustTimers();
  }

  //
  // pack/unpack
  //
  String pack() {
    String result = "VER "+kVersion+";"; // match with unpack()
    result += numberTimers.toString() + ";";
    for (var value in useTimer) {
      result += value.toString() + ";";
    }
    return result;
  }

  void unpack(String packed) {
    if (packed.length == 0) return;

    var parts = packed.split(";");
    int index = 0;
    if (parts[index++] != ("VER "+kVersion)) return; // match with pack()

    numberTimers = int.parse(parts[index++]);
    for (int i = 0; i < useTimer.length; i++) {
      useTimer[i] = parts[index++] == "true";
    }

    adjustTimers();
  }

  //
  // Public methods
  //

  String getLabel(int x, int y) {
    return grid[x][y].label;
  }

  String setLabel(int x, int y, String label) {
    return grid[x][y].label = label;
  }

 
  void adjustTimers() {
    this.grid[timer1X][timer1Y].disabled = !this.useTimer[0];
    this.grid[timer2X][timer2Y].disabled = !this.useTimer[1];
    this.grid[timer3X][timer3Y].disabled = !this.useTimer[2];
    this.grid[timer4X][timer4Y].disabled = !this.useTimer[3];
    this.grid[timer5X][timer5Y].disabled = !this.useTimer[4];
    this.grid[timer6X][timer6Y].disabled = !this.useTimer[5];
    this.grid[timer7X][timer7Y].disabled = !this.useTimer[6];
    this.grid[timer8X][timer8Y].disabled = !this.useTimer[7];
    this.grid[timer9X][timer9Y].disabled = !this.useTimer[8];
    this.grid[timer10X][timer10Y].disabled = !this.useTimer[9];
    this.grid[timer11X][timer11Y].disabled = !this.useTimer[10];
    this.grid[timer12X][timer12Y].disabled = !this.useTimer[11];
  }

  bool processKey(int x, int y) {
    var result = false;
    if (grid[x][y].disabled) return result;

    if (x == pauseAllX && y == pauseAllY) {
      print("pauseAll");
    }
     if (x == playAllX && y == playAllY) {
      print("playAll");
    }
   if (x == settingsX && y == settingsY) {
      print("settings");
    }
  
    if (x == timer1X && y == timer1Y) {
      print("timer1");
    }
    if (x == timer2X && y == timer2Y) {
      print("timer2");
    }
    if (x == timer3X && y == timer3Y) {
      print("timer3");
    }
    if (x == timer4X && y == timer4Y) {
      print("timer4");
    }
    if (x == timer5X && y == timer5Y) {
      print("timer5");
    }
    if (x == timer6X && y == timer6Y) {
      print("timer6");
    }
    if (x == timer7X && y == timer7Y) {
      print("timer7");
    }
    if (x == timer8X && y == timer8Y) {
      print("timer8");
    }
    if (x == timer9X && y == timer9Y) {
      print("timer9");
    }
    if (x == timer10X && y == timer10Y) {
      print("timer10");
    }
    if (x == timer11X && y == timer11Y) {
      print("timer11");
    }
    if (x == timer12X && y == timer12Y) {
      print("timer12");
    }

    if (x == resetNX && y == restNY) {
      print("resetN");
    }
    if (x == resetAllX && y == resetAllY) {
      print("resetAll");
    }

    return result;
  }


  KeyType getKeyType(int x, int y) {
    KeyType t = KeyType.none;
    if (x == pauseAllX && y == pauseAllY) {
      t = KeyType.pauseAll;
    }
    if (x == playAllX && y == playAllY) {
      t = KeyType.playAll;
    }
    if (x == settingsX && y == settingsY) {
      t = KeyType.settings;
    }
  
    if (x == timer1X && y == timer1Y) {
      t = KeyType.timer1;
    }
    if (x == timer2X && y == timer2Y) {
      t = KeyType.timer2;
    }
    if (x == timer3X && y == timer3Y) {
      t = KeyType.timer3;
    }
    if (x == timer4X && y == timer4Y) {
      t = KeyType.timer4;
    }
    if (x == timer5X && y == timer5Y) {
      t = KeyType.timer5;
    }
    if (x == timer6X && y == timer6Y) {
      t = KeyType.timer6;
    }
    if (x == timer7X && y == timer7Y) {
      t = KeyType.timer7;
    }
    if (x == timer8X && y == timer8Y) {
      t = KeyType.timer8;
    }
    if (x == timer9X && y == timer9Y) {
      t = KeyType.timer9;
    }
    if (x == timer10X && y == timer10Y) {
      t = KeyType.timer10;
    }
    if (x == timer11X && y == timer11Y) {
      t = KeyType.timer11;
    }
    if (x == timer12X && y == timer12Y) {
      t = KeyType.timer12;
    }

    if (x == resetNX && y == restNY) {
      t = KeyType.resetN;
    }
    if (x == resetAllX && y == resetAllY) {
      t = KeyType.resetAll;
    }
    return t;
  }

  int getTimerNumber(int x, int y) {
    var result = 0;
    if (x == timer1X && y == timer1Y) {
      result = 1;
    }
    if (x == timer2X && y == timer2Y) {
      result = 2;
    }
    if (x == timer3X && y == timer3Y) {
      result = 3;
    }
    if (x == timer4X && y == timer4Y) {
      result = 4;
    }
    if (x == timer5X && y == timer5Y) {
      result = 5;
    }
    if (x == timer6X && y == timer6Y) {
      result = 6;
    }
    if (x == timer7X && y == timer7Y) {
      result = 7;
    }
    if (x == timer8X && y == timer8Y) {
      result = 8;
    }
    if (x == timer9X && y == timer9Y) {
      result = 9;
    }
    if (x == timer10X && y == timer10Y) {
      result = 10;
    }
    if (x == timer11X && y == timer11Y) {
      result = 11;
    }
    if (x == timer12X && y == timer12Y) {
      result = 12;
    }
    return result;
  }

}