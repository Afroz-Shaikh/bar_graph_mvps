import 'dart:math';

import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:bar_graph_components/size/util_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class InventoryTurnOver extends StatelessWidget {
  const InventoryTurnOver(
      {super.key, required this.heatMapData, required this.graphTitle});
  final List<GraphDataItem> heatMapData;
  final String graphTitle;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ColoredBox(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight,
                    maxWidth: constraints.maxWidth),
                child: Row(
                  children: [
                    Container(
                      color: Colors.white,
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                              width: 40,
                              child: KBarChartGraph(
                                intervalBetweenXcoordiante: 50,
                                maxY: 160,
                                minY: -30,
                                barData: [],
                                reservedSize: 40,
                                getLeftTitlesFormater: (value, meta) {
                                  if (value > 150 || value < 0) {
                                    return const SizedBox.shrink();
                                  }

                                  return Text("${(value / 10).toInt()}%",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: UiSizeConfig
                                              .getResponsiveConstrainFont(
                                                  [16, 12, 10])));
                                },
                              )),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth <
                                            heatMapData.length * 49 * 2.0
                                        ? heatMapData.length * 130.toDouble()
                                        : constraints.maxWidth,
                                    child: KBarChartGraph(
                                      rangeAnnotations: RangeAnnotations(
                                          horizontalRangeAnnotations: [
                                            HorizontalRangeAnnotation(
                                                y1: 0,
                                                y2: 60,
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.bottomCenter,
                                                    end: Alignment.topCenter,
                                                    colors: [
                                                      Colors.white,
                                                      Color(0xff55C5BE)
                                                    ]))
                                          ]),
                                      groupSapce: 30.toResponsiveWidth,
                                      alignment: BarChartAlignment.spaceAround,
                                      barData: [
                                        ...heatMapData.map((e) {
                                          return BarDataModel(
                                            width: 49.toResponsiveWidth,
                                            showTextOnTop: DisplayTextModel(
                                                show: false,
                                                text: e.title,
                                                textStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10)),
                                            x: heatMapData.indexOf(e),
                                            y: [
                                              BarYData(
                                                  color: Colors.blue,
                                                  toY: e.percentage)
                                            ],
                                          );
                                        }),
                                      ],
                                      barTouchData:
                                          BarTouchData(enabled: false),
                                      flGridData: FlGridData(
                                        drawVerticalLine: false,
                                        checkToShowHorizontalLine: (value) {
                                          if (value / 90 == 0) {
                                            return true;
                                          }
                                          return false;
                                        },
                                      ),
                                      getBottomTitlesFormater: (value, meta) {
                                        int va = (value).toInt();

                                        return !UiSizeConfig.isMobile
                                            ? SizedBox(
                                                // height: 70,
                                                child: Tooltip(
                                                  message:
                                                      heatMapData[va].title,
                                                  child: SizedBox(
                                                    child: Text(
                                                      heatMapData[va].title,
                                                      style: const TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 10),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Transform.rotate(
                                                angle: pi / -4.10,
                                                child: SizedBox(
                                                  width: 50,
                                                  child: Text(
                                                    heatMapData[va].title,
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10),
                                                  ),
                                                ));
                                      },
                                      maxY: 110,
                                      rodBorderRadius: BorderRadius.circular(0),
                                      minY: -10,
                                      intervalBetweenXcoordiante: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      );
    });
  }
}
