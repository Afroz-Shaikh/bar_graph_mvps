import 'dart:math';

import 'package:bar_graph_components/main.dart';
import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:bar_graph_components/size/util_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class VendorRatingGraph extends StatelessWidget {
  const VendorRatingGraph({super.key, required this.data});
  final List<GraphDataItem> data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  maxWidth: constraints.maxWidth),
              child: Row(
                children: [
                  SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.white,
                            width: 60,
                            child: KBarChartGraph(
                              maxY: 110,
                              minY: -20,
                              barData: [],
                              getLeftTitlesFormater: (value, meta) {
                                if (value < 20 ||
                                    value > 100 ||
                                    value % 20 != 0) {
                                  return const SizedBox.shrink();
                                }
                                return Text(
                                  "$value%",
                                  style: TextStyle(color: Colors.grey),
                                );
                              },
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width:
                                        constraints.maxWidth < data.length * 120
                                            ? data.length * 120.toDouble()
                                            : constraints.maxWidth,
                                    height: constraints.maxHeight,
                                    child: KBarChartGraph(
                                      alignment: BarChartAlignment.spaceAround,
                                      groupSapce: 100.toResponsiveWidth,
                                      maxY: 110,
                                      border: const Border(
                                          bottom: BorderSide(),
                                          left: BorderSide()),
                                      minY: 0,
                                      flGridData: FlGridData(
                                        drawVerticalLine: false,
                                        checkToShowHorizontalLine: (value) {
                                          if (value % 20 != 0) {
                                            return false;
                                          }
                                          return true;
                                        },
                                      ),
                                      getBottomTitlesFormater: (value, meta) {
                                        int va = (value).toInt();
                                        return !UiSizeConfig.isMobile
                                            ? SizedBox(
                                                // height: 70,
                                                child: Tooltip(
                                                  message: data[va].title,
                                                  child: SizedBox(
                                                    child: Text(
                                                      data[va].title,
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
                                                  width: 30,
                                                  child: Text(
                                                    data[va].title,
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10),
                                                  ),
                                                ));
                                      },
                                      rodBorderRadius: BorderRadius.circular(0),
                                      barData: [
                                        ...data.map((e) {
                                          return BarDataModel(
                                            width: 25,
                                            showTextOnTop: DisplayTextModel(
                                                show: false,
                                                text: e.percentage.toString(),
                                                textStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10)),
                                            x: data.indexOf(e),
                                            y: [
                                              BarYData(
                                                  color: Color(0xff8F00FF),
                                                  targetColor:
                                                      Color(0xff9086FF),
                                                  toY: e.percentage,
                                                  target: e.percentage + 10)
                                            ],
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
