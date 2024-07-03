import 'package:flutter/material.dart';

class BarDataModel {
  final int x;
  final List<BarYData> y;
  final DisplayTextModel? showTextOnTop;
  final double? width;
  BarDataModel(
      {required this.x, this.y = const [], this.width, this.showTextOnTop});
  bool get shouldShowTextOnTop => showTextOnTop != null && showTextOnTop!.show!;
}

class BarYData {
  final double toY;
  final double? fromY;
  final double? target;
  final Color? targetColor;
  final Color color;
  BarYData({
    required this.color,
    required this.toY,
    this.targetColor,
    this.target,
    this.fromY,
  });
}

class DisplayTextModel {
  final bool? show;
  final String? text;
  final TextStyle? textStyle;

  DisplayTextModel({this.show = false, this.text, this.textStyle});
}

class LegendModel {
  final Color color;
  final String label;
  final String? percentage;
  LegendModel({required this.color, required this.label, this.percentage});
}

enum LegendAlignment {
  left,
  right,
  top,
  // topLeft,
  topRight,
  bottom
}
