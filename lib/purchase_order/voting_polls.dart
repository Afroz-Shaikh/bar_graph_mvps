import 'dart:math';

import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:bar_graph_components/size/util_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VotingPolls extends StatelessWidget {
  const VotingPolls(
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
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      width: constraints.maxWidth,
                      height: 400,
                      child: Column(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: constraints.maxWidth,
                                    height: 10 * 50,
                                    child: RotatedBox(
                                        quarterTurns: 1,
                                        child: BarChart(BarChartData(
                                            borderData: FlBorderData(
                                              border:
                                                  Border(bottom: BorderSide()),
                                            ),
                                            gridData:
                                                const FlGridData(show: false),
                                            titlesData: FlTitlesData(
                                                rightTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                  interval: 20,
                                                  showTitles: false,
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    return RotatedBox(
                                                        quarterTurns: 3,
                                                        child: Text(
                                                          "${value.toInt()}%",
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 10),
                                                        ));
                                                  },
                                                )),
                                                leftTitles: const AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                topTitles: const AxisTitles(
                                                    sideTitles: SideTitles(
                                                        showTitles: false)),
                                                bottomTitles: AxisTitles(
                                                    sideTitles: SideTitles(
                                                  reservedSize: 80,
                                                  showTitles: true,
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    if (value.toInt() == 10) {
                                                      return const RotatedBox(
                                                        quarterTurns: 3,
                                                        child: Text("Alan",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                      );
                                                    } else {
                                                      return const RotatedBox(
                                                        quarterTurns: 3,
                                                        child: Text("Afroz",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            )),
                                                      );
                                                    }
                                                  },
                                                ))),
                                            minY: 0,
                                            maxY: 110,
                                            groupsSpace: 20,
                                            alignment:
                                                BarChartAlignment.spaceAround,
                                            barGroups: [
                                              BarChartGroupData(x: 0, barRods: [
                                                BarChartRodData(
                                                    toY: 60,
                                                    width: 40,
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0))
                                              ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Colors.blueAccent,
                                                        toY: 30,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color: Colors.amber,
                                                        toY: 30,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0))
                                                  ]),
                                              BarChartGroupData(x: 0, barRods: [
                                                BarChartRodData(
                                                    toY: 60,
                                                    width: 40,
                                                    color: Colors.red,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0))
                                              ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Colors.blueAccent,
                                                        toY: 30,
                                                        // ,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color: Colors.amber,
                                                        toY: 30,
                                                        width: 40,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0))
                                                  ]),
                                            ]))),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      width: double.maxFinite,
                      height: 150,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 80.0),
                          child: KBarChartGraph(
                            minY: 0,
                            maxY: 110,
                            barData: const [
                              //NO  DATA as of now for this graph so keeping it empty
                            ],
                            getLeftTitlesFormater: (value, meta) {
                              if (value != 0 && value != 1) {
                                return RotatedBox(
                                  quarterTurns: 3,
                                  child: Text(
                                    value.toString(),
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      );
    });
  }
}


// KBarChartGraph(
//                                         groupSapce: 20,
//                                         alignment: BarChartAlignment.start,
//                                         barData: [
//                                           BarDataModel(x: 10, y: [
//                                             BarYData(color: Colors.red, toY: 10)
//                                           ]),
//                                           BarDataModel(x: 30, y: [
//                                             BarYData(
//                                                 color: Colors.green, toY: 20)
//                                           ]),
//                                           BarDataModel(x: 10, y: [
//                                             BarYData(color: Colors.red, toY: 10)
//                                           ]),
//                                           BarDataModel(x: 30, y: [
//                                             BarYData(
//                                                 color: Colors.green, toY: 20)
//                                           ]),
//                                           BarDataModel(x: 10, y: [
//                                             BarYData(color: Colors.red, toY: 10)
//                                           ]),
//                                           BarDataModel(x: 30, y: [
//                                             BarYData(
//                                                 color: Colors.green, toY: 20)
//                                           ])
//                                           // ...heatMapData.map(
//                                           //   (e) {
//                                           //     return BarDataModel(
//                                           //       width: 49.toResponsiveWidth,
//                                           //       showTextOnTop: DisplayTextModel(
//                                           //           show: false,
//                                           //           text: e.title,
//                                           //           textStyle: const TextStyle(
//                                           //               color: Colors.grey,
//                                           //               fontSize: 10)),
//                                           //       x: heatMapData.indexOf(e),
//                                           //       y: [
//                                           //         BarYData(
//                                           //             color: Colors.blue,
//                                           //             toY: e.percentage)
//                                           //       ],
//                                           //     );
//                                           //   },
//                                           // ),
//                                         ],
//                                         barTouchData:
//                                             BarTouchData(enabled: false),
//                                         flGridData: FlGridData(
//                                           drawVerticalLine: false,
//                                           checkToShowHorizontalLine: (value) {
//                                             if (value % 20 != 0) {
//                                               return false;
//                                             }
//                                             return true;
//                                           },
//                                         ),
//                                         reservedSize: 80,
//                                         getBottomTitlesFormater: (value, meta) {
//                                           int va = (value).toInt();
//                                           return RotatedBox(
//                                             quarterTurns: 3,
//                                             child: SizedBox(
//                                               child: Tooltip(
//                                                 message: value.toString(),
//                                                 child: SizedBox(
//                                                   child: Text(
//                                                     value.toString(),
//                                                     style: const TextStyle(
//                                                         color: Colors.grey,
//                                                         fontSize: 10),
//                                                     overflow:
//                                                         TextOverflow.ellipsis,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//                                         },
//                                         maxY: 110,
//                                         rodBorderRadius:
//                                             BorderRadius.circular(0),
//                                         minY: -10,
//                                       ),