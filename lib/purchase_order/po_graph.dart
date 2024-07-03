import 'dart:math';

import 'package:bar_graph_components/models/bar_model.dart';
import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/size/util_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HorizontalBarChart extends StatelessWidget {
  const HorizontalBarChart(
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
                      width: !UiSizeConfig.isMobile
                          ? constraints.maxWidth * 0.73
                          : constraints.maxWidth,
                      height: !UiSizeConfig.isMobile
                          ? constraints.maxHeight
                          : constraints.maxHeight * 0.8,
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                              width: 40,
                              child: KBarChartGraph(
                                maxY: 110,
                                minY: -14,
                                barData: [],
                                reservedSize: 40,
                                getLeftTitlesFormater: (value, meta) {
                                  if (value > 100 ||
                                      value < 0 ||
                                      value % 20 != 0) {
                                    return const SizedBox.shrink();
                                  }

                                  return Text(value.toInt().toString(),
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
                                    width: constraints.maxWidth * 0.7 <
                                            heatMapData.length * 49 * 2.0
                                        ? heatMapData.length * 130.toDouble()
                                        : constraints.maxWidth * 0.7,
                                    child: KBarChartGraph(
                                      groupSapce: 30.toResponsiveWidth,
                                      alignment: BarChartAlignment.spaceAround,
                                      barData: [
                                        ...heatMapData.map((e) {
                                          return BarDataModel(
                                            width: 49.toResponsiveWidth,
                                            showTextOnTop: DisplayTextModel(
                                                show: true,
                                                text: e.title,
                                                textStyle: const TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 10)),
                                            x: heatMapData.indexOf(e),
                                            y: [
                                              BarYData(
                                                  color: e.color,
                                                  toY: e.percentage)
                                            ],
                                          );
                                        }),
                                      ],
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
                                            : SideTitleWidget(
                                                axisSide: meta.axisSide,
                                                fitInside:
                                                    SideTitleFitInsideData(
                                                        enabled: true,
                                                        axisPosition:
                                                            meta.axisPosition,
                                                        parentAxisSize:
                                                            meta.parentAxisSize,
                                                        distanceFromEdge: 0),
                                                angle: degreeToRadian(-45),
                                                child: SizedBox(
                                                  width: 30,
                                                  child: Text(
                                                    heatMapData[va].title,
                                                    style: const TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 10),
                                                  ),
                                                ),
                                              );
                                      },
                                      maxY: 110,
                                      rodBorderRadius: BorderRadius.circular(0),
                                      minY: -4,
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
                    Visibility(
                        visible: !UiSizeConfig.isMobile,
                        child: Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              child: ColoredBox(
                                color: Colors.white,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...heatMapData.map((e) => KLegendItem(
                                          width: double.maxFinite,
                                          color: e.color,
                                          text: e.title,
                                          subText: '${e.percentage}%',
                                          isDecorated: false,
                                        ))
                                  ],
                                ),
                              ),
                            )))
                  ],
                )),
            Visibility(
              visible: UiSizeConfig.isMobile,
              child: SizedBox(
                width: double.maxFinite,
                height: constraints.maxHeight * 0.2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ColoredBox(
                    color: Colors.white,
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.start,
                      spacing: 0,
                      children: [
                        ...heatMapData.map(
                          (e) => KLegendItem(
                            width: 180,
                            isDecorated: false,
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
        ),
      );
    });
  }
}

double degreeToRadian(double degree) {
  return degree * pi / 180;
}

class KBarChartGraph extends StatelessWidget {
  final double? groupSapce;
  final List<BarDataModel> barData;
  final BorderRadius? rodBorderRadius;
  final double? maxY;
  final Border? border;
  final FlGridData? flGridData;
  final BarTouchData? barTouchData;
  final double? minY;
  final double? intervalBetweenXcoordiante;
  final double? reservedSize;
  final double? barspace;
  final RangeAnnotations? rangeAnnotations;
  final BarChartAlignment? alignment;
  final Widget Function(double value, TitleMeta meta)? getLeftTitlesFormater;
  final Widget Function(double value, TitleMeta meta)? getTopTitlesFormater;
  final Widget Function(double value, TitleMeta meta)? getRightTitlesFormater;
  final Widget Function(double value, TitleMeta meta)? getBottomTitlesFormater;
  final String Function(String value)? toolTipTextFormater;
  const KBarChartGraph({
    super.key,
    required this.barData,
    this.groupSapce,
    this.rodBorderRadius,
    this.reservedSize,
    this.alignment,
    this.barspace,
    this.border,
    this.flGridData,
    this.rangeAnnotations,
    this.getLeftTitlesFormater,
    this.getBottomTitlesFormater,
    this.getRightTitlesFormater,
    this.getTopTitlesFormater,
    this.toolTipTextFormater,
    this.barTouchData,
    this.intervalBetweenXcoordiante,
    this.minY,
    this.maxY,
  });

  @override
  Widget build(BuildContext context) {
    //! CHANGE EXpanded to SizedBox
    return BarChart(
      BarChartData(
        alignment: alignment ?? BarChartAlignment.start,
        groupsSpace: groupSapce ?? 60,
        borderData: FlBorderData(show: border != null, border: border),
        gridData: flGridData ??
            const FlGridData(
              show: false,
            ),
        titlesData: FlTitlesData(
            show: true,
            leftTitles: getAxisTitle(getLeftTitlesFormater,
                intervel: intervalBetweenXcoordiante,
                reservedSize: reservedSize),
            rightTitles: getAxisTitle(getRightTitlesFormater,
                intervel: intervalBetweenXcoordiante),
            topTitles: getAxisTitle(getTopTitlesFormater,
                intervel: intervalBetweenXcoordiante),
            bottomTitles: getAxisTitle(
              getBottomTitlesFormater,
              intervel: intervalBetweenXcoordiante,
              reservedSize: reservedSize,
            )),
        maxY: maxY ?? 30,
        minY: minY,
        rangeAnnotations: rangeAnnotations ?? null,
        barGroups: barData
            .map(
              (e) => BarChartGroupData(
                  showingTooltipIndicators:
                      (e.shouldShowTextOnTop && e.y.length == 1) ||
                              toolTipTextFormater != null
                          ? [0]
                          : null,
                  barsSpace: barspace ?? 20,
                  x: e.x,
                  barRods: e.y
                      .map(
                        (e1) => BarChartRodData(
                            toY: e1.toY,
                            color: e1.color,
                            fromY: e1.fromY,
                            width: e.width ?? 40,
                            backDrawRodData: e1.target == null
                                ? null
                                : BackgroundBarChartRodData(
                                    toY: e1.target,
                                    show: true,
                                    color: e1.targetColor),
                            borderRadius: rodBorderRadius ??
                                BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                      )
                      .toList()),
            )
            .toList(),
        barTouchData: barTouchData ??
            BarTouchData(
              // enabled: true,
              touchTooltipData: BarTouchTooltipData(
                tooltipPadding: EdgeInsets.zero,
                getTooltipColor: (group) {
                  return Colors.transparent;
                },
                getTooltipItem: (group, groupIndex, rod, rodIndex) {
                  return BarTooltipItem(
                      toolTipTextFormater?.call(rod.toY.toString()) ??
                          barData[groupIndex].showTextOnTop?.text ??
                          rod.toY.toString(),
                      barData[groupIndex].showTextOnTop?.textStyle ??
                          const TextStyle(
                              color: Colors.black,
                              fontSize: 26,
                              fontWeight: FontWeight.w800));
                },
              ),
            ),
      ),
    );
  }

  AxisTitles getAxisTitle(Widget Function(double, TitleMeta)? tileFunction,
      {double? intervel, double? reservedSize}) {
    return AxisTitles(
      sideTitles: SideTitles(
          reservedSize: reservedSize ?? 60,
          interval: intervel,
          getTitlesWidget: tileFunction ?? defaultGetTitle,
          showTitles: tileFunction != null),
    );
  }

  Widget defaultGetTitle(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(
        meta.formattedValue,
      ),
    );
  }
}

class KLegend extends StatelessWidget {
  final List<LegendModel> legendData;
  final TextStyle? textStyle;
  final String? subText;
  final bool isHorizontal;
  const KLegend(
      {super.key,
      required this.legendData,
      this.subText = '',
      this.textStyle,
      this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    return isHorizontal
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: legendData
                .map((e) => KLegendItem(
                      color: e.color,
                      text: e.label,
                      textStyle: textStyle,
                    ))
                .toList())
        : Column(
            mainAxisSize: MainAxisSize.min,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: legendData
                .map((e) => KLegendItem(
                      color: e.color,
                      text: e.label,
                      subText: e.percentage,
                    ))
                .toList());
  }
}

class KLegendItem extends StatelessWidget {
  final Color color;
  final String text;
  final String? subText;
  final TextStyle? textStyle;
  final double? width;
  final bool? isDecorated;
  const KLegendItem(
      {super.key,
      required this.color,
      required this.text,
      this.width,
      this.isDecorated = false,
      this.textStyle,
      this.subText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: isDecorated!
              ? Color(0xffd9d9d9).withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14)),
      width: width ?? 140,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 10,
                    width: 10,
                    decoration:
                        BoxDecoration(color: color, shape: BoxShape.circle),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Text(
                        text,
                        softWrap: false,
                        style: textStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              subText ?? '',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}

class ScrollableBarChartView extends StatelessWidget {
  const ScrollableBarChartView(
      {super.key,
      required this.data,
      this.isLeftAxisRequired = true,
      this.getBottomTitlesFormater,
      this.showTextOnTop,
      this.isLegendDecorated = false,
      required this.flGridData});
  final List<HeatMapData> data;
  final bool isLeftAxisRequired;
  final FlGridData flGridData;
  final bool isLegendDecorated;
  final DisplayTextModel? showTextOnTop;

  final Widget Function(double, TitleMeta)? getBottomTitlesFormater;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.80,
            child: Row(
              children: [
                isLeftAxisRequired
                    ? SizedBox(
                        width: 60,
                        child: KBarChartGraph(
                          maxY: 110,
                          minY: -20,
                          barData: [],
                          getLeftTitlesFormater: (value, meta) {
                            if (value == -10 || value == 110) {
                              return const SizedBox.shrink();
                            }
                            return Text(value.toInt().toString());
                          },
                        ))
                    : const SizedBox.shrink(),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: data.length * 100.toResponsiveWidth,
                            child: KBarChartGraph(
                              barData: [
                                ...data.map((e) {
                                  return BarDataModel(
                                    width: 49.toResponsiveWidth,
                                    showTextOnTop: DisplayTextModel(
                                        show: true,
                                        text: e.percentage.toString(),
                                        textStyle: const TextStyle(
                                            color: Colors.grey, fontSize: 10)),
                                    // index of e in jsonData['data']['PO_PURCHASE_ORDER_GRAPH'],
                                    x: data.indexOf(e),
                                    y: [
                                      BarYData(
                                          color: e.color, toY: e.percentage)
                                    ],
                                  );
                                }),
                              ],
                              flGridData: flGridData,
                              getBottomTitlesFormater: getBottomTitlesFormater,
                              maxY: 110,
                              rodBorderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              minY: -10,
                              intervalBetweenXcoordiante: 20,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.20,
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.start,
                children: [
                  ...data.map(
                    (e) => KLegendItem(
                      isDecorated: isLegendDecorated,
                      subText: '${e.percentage}%',
                      color: e.color,
                      text: e.title,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

// class BarChartExample2 extends StatelessWidget {
//   const BarChartExample2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return KBarChart(
//         maxY: 200,
//         minY: -10,
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         rodBorderRadius: BorderRadius.circular(0),
//         legend: [
//           LegendModel(color: Colors.yellow, label: 'data 1', percentage: '15'),
//           LegendModel(color: Colors.blue, label: 'data 2', percentage: '48'),
//           LegendModel(color: Colors.purple, label: 'data 3', percentage: '30'),
//           LegendModel(color: Colors.grey, label: 'data 4', percentage: '7'),
//         ],
//         toolTipTextFormater: (value) {
//           return value;
//         },
//         barData: data2);
//   }
// }
