import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WareHouseMisGraph extends StatelessWidget {
  const WareHouseMisGraph({super.key, required this.data});
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
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                    width: 60,
                    child: KBarChartGraph(
                      maxY: 110,
                      minY: -20,
                      barData: [],
                      getLeftTitlesFormater: (value, meta) {
                        if (value < 0 || value > 100 || value % 20 != 0) {
                          return const SizedBox.shrink();
                        }
                        return Text("${value.toInt()}");
                      },
                    )),
                Expanded(
                    child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        width: data.length * 60.0,
                        child: KBarChartGraph(
                          alignment: BarChartAlignment.spaceAround,
                          groupSapce: 200,
                          maxY: 110,
                          minY: 0,
                          getBottomTitlesFormater: (value, meta) {
                            return Text(value.toInt().toString());
                          },
                          barData: [
                            ...data.map((e) {
                              return BarDataModel(
                                width: 20,
                                showTextOnTop: DisplayTextModel(
                                    show: false,
                                    text: e.percentage.toString(),
                                    textStyle: const TextStyle(
                                        color: Colors.grey, fontSize: 10)),
                                x: data.indexOf(e),
                                y: [
                                  BarYData(
                                      color: Colors.blueAccent,
                                      toY: e.percentage,
                                      target: 100,
                                      targetColor: const Color(0xffD9F2F0))
                                ],
                              );
                            }),
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
