import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SkillMatrix extends StatelessWidget {
  const SkillMatrix(
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
                                              border: Border(),
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
                                                  reservedSize: 200,
                                                  showTitles: true,
                                                  getTitlesWidget:
                                                      (value, meta) {
                                                    {
                                                      return Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: RotatedBox(
                                                          quarterTurns: 3,
                                                          child: Text(
                                                              "Skill Level ${value.toInt().toString()}",
                                                              style:
                                                                  const TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                              )),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ))),
                                            minY: -5,
                                            maxY: 110,
                                            groupsSpace: 20,
                                            alignment:
                                                BarChartAlignment.spaceAround,
                                            barGroups: [
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        rodStackItems: [
                                                          BarChartRodStackItem(
                                                              0,
                                                              30,
                                                              Colors.green),
                                                          BarChartRodStackItem(
                                                              30,
                                                              40,
                                                              Colors.red),
                                                        ],
                                                        color: Colors.grey,
                                                        toY: 100,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                                show: true,
                                                                color: const Color(
                                                                    0xff99C3FF),
                                                                toY: 50),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color: const Color(
                                                            0xff006AFF),
                                                        toY: 30,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                          show: true,
                                                          color: const Color(
                                                              0xff99C3FF),
                                                          toY: 50,
                                                        ),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Color(0xff006AFF),
                                                        toY: 30,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                          show: true,
                                                          color:
                                                              Color(0xff99C3FF),
                                                          toY: 50,
                                                        ),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Color(0xff006AFF),
                                                        toY: 30,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                          show: true,
                                                          color:
                                                              Color(0xff99C3FF),
                                                          toY: 50,
                                                        ),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Color(0xff006AFF),
                                                        toY: 30,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                          show: true,
                                                          color:
                                                              Color(0xff99C3FF),
                                                          toY: 50,
                                                        ),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Color(0xff006AFF),
                                                        toY: 30,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                          show: true,
                                                          color:
                                                              Color(0xff99C3FF),
                                                          toY: 50,
                                                        ),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
                                                  ]),
                                              BarChartGroupData(
                                                  x: 10,
                                                  barRods: [
                                                    BarChartRodData(
                                                        color:
                                                            Color(0xff006AFF),
                                                        toY: 30,
                                                        backDrawRodData:
                                                            BackgroundBarChartRodData(
                                                          show: true,
                                                          color:
                                                              Color(0xff99C3FF),
                                                          toY: 50,
                                                        ),
                                                        width: 10,
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                topRight: Radius
                                                                    .circular(
                                                                        10)))
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
                  ],
                )),
          ],
        ),
      );
    });
  }
}
