import 'package:flutter/material.dart';
import 'package:nightmode/them_controller.dart';

Color cellColor = "#EEEEEE".toColor();
Color bgColor = "#FAFAFA".toColor();
Color textColor = "#000000".toColor();
Color subTextColor = Colors.grey.shade600;

class ConstantData {
  static setThemePosition() async {
    int themMode = await PrefData.getThemeMode();

    print("themeMode-----$themMode");

    if (themMode == 1) {
      textColor = Colors.white;
      bgColor = "#13151B".toColor();
      cellColor = "#1F1F1F".toColor();
      subTextColor = Colors.white70;
    } else {
      textColor = "#000000".toColor();
      bgColor = "#FAFAFA".toColor();
      cellColor = "#ffffff".toColor();
      subTextColor = Colors.grey.shade600;
    }
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}
