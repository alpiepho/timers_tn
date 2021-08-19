import 'package:flutter/material.dart';
import 'package:timers_tn/constants.dart';

class Cell {
  String label;
  TextStyle style;
  bool halfHeight;
  Color background;
  bool gradient;
  int flex;
  bool disabled;
  bool active;

  Cell({
    this.label = '',
    this.style = kNumberTextStyle,
    this.halfHeight = false,
    this.background = Colors.grey,
    this.gradient = true,
    this.flex = 1,
    this.disabled = false,
    this.active = false,
  });
}

class Timer {
  String label;
  Color color;

  Timer({
    this.label = '',
    this.color = Colors.green, // green, yellow, orange, red
  });
}

class Engine {
  var grid = List.generate(6, (i) => List.generate(3, (index) => Cell()),
      growable: false);
  int pauseAllX = -1;
  int pauseAllY = -1;
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


  Engine() {
    int row = 0;
    int col = 0;
    grid[row][col] = new Cell(label: "PauseAll", style: kLabelTextStyle);
    pauseAllX = row;
    pauseAllY = col;
    col++;
    grid[row][col] = new Cell(label: "", style: kLabelTextStyle);
    col++;
    grid[row][col] = new Cell(label: "?", style: kLabelTextStyle);
    settingsX = row;
    settingsY = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer1X = row;
    timer1Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer2X = row;
    timer2Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer3X = row;
    timer3Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer4X = row;
    timer4Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer5X = row;
    timer5Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer6X = row;
    timer6Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer7X = row;
    timer7Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer8X = row;
    timer8Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer9X = row;
    timer9Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer10X = row;
    timer10Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer11X = row;
    timer11Y = col;
    col++;
    grid[row][col] = new Cell(label: "00:00.00", style: kLabelTextStyle);
    timer12X = row;
    timer12Y = col;
    col++;
    row++;
    col = 0;
    grid[row][col] = new Cell(label: "ResetN", style: kLabelTextStyle);
    resetNX = row;
    restNY = col;
    col++;
    grid[row][col] = new Cell(label: "", style: kLabelTextStyle);
    col++;
    grid[row][col] = new Cell(label: "ResetAll", style: kLabelTextStyle);
    resetAllX = row;
    resetAllY = col;
    col++;
    row++;
    adjustTimers();
  }

  //
  // pack/unpack
  //
  String pack() {
    String result = "VER "+kVersion+";"; // match with unpack()
    result += numberTimers.toString() + ";";
    return result;
  }

  void unpack(String packed) {
    if (packed.length == 0) return;

    var parts = packed.split(";");
    int index = 0;
    if (parts[index++] != ("VER "+kVersion)) return; // match with pack()

    numberTimers = int.parse(parts[index++]);

    adjustTimers();
  }

  // void setActive(String key) {
  //   for (int x = 0; x < grid.length; x++) {
  //     for (int y = 0; y < grid[0].length; y++) {
  //       if (key == grid[x][y].label) {
  //         grid[x][y].active = true;
  //       }
  //     }
  //   }
  //   //lastOp = "";
  // }

  // void clearActive(String key) {
  //   for (int x = 0; x < grid.length; x++) {
  //     for (int y = 0; y < grid[0].length; y++) {
  //       if (key == grid[x][y].label) {
  //         grid[x][y].active = false;
  //       }
  //     }
  //   }
  //   //lastOp = "";
  // }

  //
  // Public methods
  //

  String getLabel(int x, int y) {
    return grid[x][y].label;
  }

  String setLabel(int x, int y, String label) {
    return grid[x][y].label = label;
  }

  TextStyle getStyle(int x, int y) {
    var style = grid[x][y].style;
    if (grid[x][y].active) {
      style = grid[x][y].style.copyWith(color: Colors.yellow);
    }
    return style;
  }

  void adjustTimers() {
    this.grid[timer1X][timer1Y].disabled = true;
    this.grid[timer2X][timer2Y].disabled = true;
    this.grid[timer3X][timer3Y].disabled = true;
    this.grid[timer4X][timer4Y].disabled = true;
    this.grid[timer5X][timer5Y].disabled = true;
    this.grid[timer6X][timer6Y].disabled = true;
    this.grid[timer7X][timer7Y].disabled = true;
    this.grid[timer8X][timer8Y].disabled = true;
    this.grid[timer9X][timer9Y].disabled = true;
    this.grid[timer10X][timer10Y].disabled = true;
    this.grid[timer11X][timer11Y].disabled = true;
    this.grid[timer12X][timer12Y].disabled = true;

    int index = 0;
    if (index < this.numberTimers) {
      this.grid[timer1X][timer1Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer2X][timer2Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer3X][timer3Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer4X][timer4Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer5X][timer5Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer6X][timer6Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer7X][timer7Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer8X][timer8Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer9X][timer9Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer10X][timer10Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer11X][timer11Y].disabled = false;
      index += 1;
    }
    if (index < this.numberTimers) {
      this.grid[timer12X][timer12Y].disabled = false;
      index += 1;
    }
  }

  bool processKey(int x, int y) {
    var result = false;
    if (grid[x][y].disabled) return result;

    if (x == pauseAllX && y == pauseAllY) {
      print("pauseAll");
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
}
