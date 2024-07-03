import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:bar_graph_components/size/util_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MSMEStatusGraph extends StatelessWidget {
  const MSMEStatusGraph({super.key, required this.data});
  final List<HeatMapData> data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  maxWidth: constraints.maxWidth),
              child: Row(
                children: [
                  SizedBox(
                      width: constraints.maxWidth * 0.67 > data.length * 50 * 2
                          ? constraints.maxWidth * 0.70
                          : constraints.maxWidth,
                      height: !UiSizeConfig.isMobile
                          ? constraints.maxHeight
                          : constraints.maxHeight * 0.9,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * 0.67 <
                                            data.length * 50 * 2
                                        ? data.length * 120.toDouble()
                                        : constraints.maxWidth * 0.7,
                                    height: constraints.maxHeight * 0.8,
                                    child: KBarChartGraph(
                                      alignment: BarChartAlignment.spaceAround,
                                      groupSapce: 20,
                                      intervalBetweenXcoordiante: 10,
                                      // groupSapce: 0,
                                      barData: [
                                        ...data.map((e) {
                                          return BarDataModel(
                                            width: 50.toResponsiveWidth,
                                            showTextOnTop: DisplayTextModel(
                                                show: true,
                                                text: e.percentage
                                                    .toInt()
                                                    .toString(),
                                                textStyle: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14)),
                                            // index of e in jsonData['data']['PO_PURCHASE_ORDER_GRAPH'],
                                            x: data.indexOf(e),
                                            y: [
                                              BarYData(
                                                  color: e.color,
                                                  toY: e.percentage)
                                            ],
                                          );
                                        }),
                                      ],
                                      flGridData: const FlGridData(
                                        show: false,
                                      ),
                                      minY: -10,
                                      maxY: 110,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Visibility(
                    visible: !UiSizeConfig.isMobile,
                    child: Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: constraints.maxHeight * 0.1,
                        ),
                        child: SingleChildScrollView(
                          child: SizedBox(
                              width: constraints.maxWidth * 0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ...data.map((e) {
                                    return KLegendItem(
                                      isDecorated: true,
                                      color: e.color,
                                      text: e.title,
                                      subText: e.percentage.toString() + '%',
                                    );
                                  })
                                ],
                              )),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Visibility(
              visible: UiSizeConfig.isMobile,
              child: SizedBox(
                width: double.maxFinite,
                height: constraints.maxHeight * 0.1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ColoredBox(
                    color: Colors.white,
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 0,
                      children: [
                        ...data.map(
                          (e) => KLegendItem(
                            width: 180,
                            isDecorated: true,
                            subText: '${e.percentage}%',
                            color: e.color,
                            text: e.title,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
