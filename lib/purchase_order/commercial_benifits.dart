import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CommercialBenifits extends StatelessWidget {
  const CommercialBenifits({super.key, required this.data});
  final List<HeatMapData> data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          ConstrainedBox(
            constraints: constraints,
            child: Row(
              children: [
                SizedBox(
                    width: 60,
                    child: KBarChartGraph(
                      maxY: 260,
                      minY: -40,
                      barData: [],
                      getLeftTitlesFormater: (value, meta) {
                        if (value < 0 || value > 260 || value % 50 != 0) {
                          return const SizedBox.shrink();
                        }
                        return Text("${value.toInt()}");
                        // return Text("${value.toInt()}");
                      },
                    )),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: data.length * 160.0,
                        child: KBarChartGraph(
                          flGridData: FlGridData(
                            checkToShowHorizontalLine: (value) {
                              return value % 20 == 0;
                            },
                            checkToShowVerticalLine: (value) {
                              return value % 0 == 0;
                            },
                          ),
                          groupSapce: 40,
                          barspace: 0,
                          maxY: 110,
                          minY: 0,
                          getBottomTitlesFormater: (value, meta) {
                            return Text(value.toInt().toString());
                          },
                          rodBorderRadius: BorderRadius.circular(10),
                          barData: [
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 20,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 30,
                              y: [
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 50,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                            BarDataModel(
                              width: 10,
                              x: 10,
                              y: [
                                BarYData(
                                  color: Color(0xff99C3FF),
                                  toY: 30,
                                ),
                                BarYData(
                                  color: Colors.blue,
                                  toY: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
