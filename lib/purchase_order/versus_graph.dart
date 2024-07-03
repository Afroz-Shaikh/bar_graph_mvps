import 'dart:developer';

import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BalanceOrderGraphCompoent extends StatelessWidget {
  const BalanceOrderGraphCompoent({super.key, required this.data});
  final List<GraphDataGroup> data;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: constraints.maxHeight, maxWidth: constraints.maxWidth),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: constraints.maxHeight - 30,
                child: KBarChartGraph(
                  minY: -10,
                  maxY: 50,
                  intervalBetweenXcoordiante: 10,
                  barData: [],
                  getLeftTitlesFormater: (value, meta) {
                    if (value > 50 || value >= 0) {
                      return Text("${value}k",
                          style: const TextStyle(color: Colors.grey));
                    }
                    return const SizedBox.shrink();
                  },
//
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width:
                            data.length * 140.toDouble() < constraints.maxWidth
                                ? constraints.maxWidth
                                : data.length * 140.toDouble(),
                        child: KBarChartGraph(
                          barspace: 10,
                          getBottomTitlesFormater: (value, meta) {
                            return Text(
                                data[(value / 10 - 1).toInt()].groupName);
                          },
                          alignment: BarChartAlignment.spaceAround,
                          groupSapce: 0,
                          maxY: 50,
                          border: const Border(),
                          minY: 0,
                          flGridData: FlGridData(
                            getDrawingHorizontalLine: (value) {
                              if (value % 10 != 0) {
                                return const FlLine(color: Colors.red);
                              }
                              return FlLine(
                                  color: Colors.grey.withOpacity(0.2));
                            },
                            drawVerticalLine: false,
                            checkToShowHorizontalLine: (value) {
                              if (value % 10 != 0) {
                                return false;
                              }
                              return true;
                            },
                          ),
                          rodBorderRadius: BorderRadius.circular(2),
                          barData: [...mapGraphDataToBarData(data)],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

List<BarDataModel> mapGraphDataToBarData(List<GraphDataGroup> graphDataGroups) {
  return graphDataGroups.asMap().entries.map((entry) {
    int index = entry.key;
    GraphDataGroup group = entry.value;

    final yData = group.items.map((item) {
      return BarYData(color: item.color, toY: double.parse(item.kpiValue));
    }).toList();
    index = index + 1;
    return BarDataModel(
        showTextOnTop: DisplayTextModel(show: false),
        x: (index * 10),
        y: yData,
        width: 42);
  }).toList();
}
