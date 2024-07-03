import 'dart:ui';

class HeatMapData {
  final Color color;
  final double percentage;
  final String subGroupId;
  final String title;
  final String kpiValue;

  HeatMapData(
      {required this.color,
      required this.title,
      required this.percentage,
      required this.kpiValue,
      required this.subGroupId});

  factory HeatMapData.fromMap({required Map<String, dynamic> json}) {
    return HeatMapData(
        title: json['KPI_TITLE'],
        kpiValue: json["KPI_VALUE"],
        color: hexToColor(json["HEX_COLOUR_CODE"]),
        subGroupId: json['KPI_SUBGROUP_ID'],
        percentage: json["PERCENTAGE"]);
  }

  static List<HeatMapData> getListOfHeatMapData(
      {required List<dynamic> jsonlist}) {
    return jsonlist.map(
      (heatMapData) {
        return HeatMapData.fromMap(json: heatMapData);
      },
    ).toList();
  }
}

Color hexToColor(String hex) {
  // Remove the '#' if it exists
  hex = hex.toUpperCase().replaceAll("#", "");
  // If the string has only 6 characters, add the 'FF' prefix for the alpha channel
  if (hex.length == 6) {
    hex = "FF" + hex;
  }
  // Convert the string to an integer and create the Color object
  return Color(int.parse(hex, radix: 16));
// }
}

class GraphDataItem {
  final Color color;
  final double percentage;
  final String subGroupId;
  final String title;
  final String kpiValue;
  final String? kpiValue2;
  final double sortId;
  final double subGroupSortId;
  final List<dynamic> callObjectEvent;
  GraphDataItem(
      {required this.color,
      required this.kpiValue,
      required this.percentage,
      required this.subGroupId,
      required this.title,
      required this.sortId,
      required this.subGroupSortId,
      required this.kpiValue2,
      required this.callObjectEvent});
  factory GraphDataItem.fromMap({required Map<String, dynamic> json}) {
    return GraphDataItem(
        title: json['KPI_TITLE'],
        kpiValue: json["KPI_VALUE1"],
        kpiValue2: json["KPI_VALUE2"],
        sortId: double.tryParse(json["KPI_SORT_ID"].toString()) ?? 0.0,
        color: hexToColor(json["HEX_COLOUR_CODE"]),
        subGroupId: json['KPI_SUBGROUP_ID'],
        subGroupSortId:
            double.tryParse(json["SUBGROUP_SR_NO"].toString()) ?? 0.0,
        percentage: json["PERCENTAGE"],
        callObjectEvent: json["CALL_OBJECT_EVENT"] ?? []);
  }
  GraphDataItem getNewItemWithUpdateColor({required Color newColor}) {
    return GraphDataItem(
        color: newColor,
        kpiValue: kpiValue,
        percentage: percentage,
        subGroupId: subGroupId,
        title: title,
        sortId: sortId,
        kpiValue2: kpiValue2,
        subGroupSortId: subGroupSortId,
        callObjectEvent: callObjectEvent);
  }
}

class GraphDataGroup {
  final String groupName;
  final List<GraphDataItem> items;

  GraphDataGroup({required this.items, required this.groupName});

  static List<GraphDataGroup> getGraphDataGroupFromListOfItems(
      {required List<GraphDataItem> items}) {
    Map<String, GraphDataGroup> groupMap = {};
    for (var element in items) {
      if (groupMap.containsKey(element.subGroupId)) {
        final currentGroupItems = groupMap[element.subGroupId]!.items;
        groupMap[element.subGroupId]!
            .items
            .addAll([...currentGroupItems, element]);
      } else {
        groupMap[element.subGroupId] =
            GraphDataGroup(items: [element], groupName: element.subGroupId);
      }
    }
    return groupMap.values.toList();
  }
}

class GraphDataModel {
  final List<GraphDataItem> items;
  final List<GraphDataGroup> groups;
  GraphDataModel({required this.items, required this.groups});

  factory GraphDataModel.fromMapListJson({required List<dynamic> mapList}) {
    mapList.sort((a, b) => a['SUBGROUP_SR_NO'].compareTo(b['SUBGROUP_SR_NO']));
    mapList.sort(
      (a, b) {
        if (a["KPI_SUBGROUP_ID"] != b["KPI_SUBGROUP_ID"]) {
          return a['KPI_SUBGROUP_ID'].compareTo(b['KPI_SUBGROUP_ID']);
        } else {
          return a['KPI_SORT_ID'].compareTo(b['KPI_SORT_ID']);
        }
      },
    );

    Map<String, GraphDataGroup> groupMap = {};
    final List<GraphDataItem> itemList = [];
    for (var element in mapList) {
      final item = GraphDataItem.fromMap(json: element);
      if (groupMap.containsKey(item.subGroupId)) {
        final currentGroupItems = groupMap[item.subGroupId]!.items;
        groupMap[item.subGroupId]!.items.addAll([...currentGroupItems, item]);
      } else {
        groupMap[item.subGroupId] =
            GraphDataGroup(items: [item], groupName: item.subGroupId);
      }
      itemList.add(item);
    }
    return GraphDataModel(items: itemList, groups: groupMap.values.toList());
  }
}
