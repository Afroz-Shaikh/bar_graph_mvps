import 'package:bar_graph_components/models/heat_map.dart';
import 'package:bar_graph_components/purchase_order/commercial_benifits.dart';
import 'package:bar_graph_components/purchase_order/msme_status.dart';
import 'package:bar_graph_components/purchase_order/order_progress.dart';
import 'package:bar_graph_components/purchase_order/po_graph.dart';
import 'package:bar_graph_components/purchase_order/skillMatrix_graph.dart';
import 'package:bar_graph_components/purchase_order/skillmatrix_col.dart';
import 'package:bar_graph_components/purchase_order/vendor_rating_graph.dart';
import 'package:bar_graph_components/purchase_order/versus_graph.dart';
import 'package:bar_graph_components/purchase_order/voting_polls.dart';
import 'package:bar_graph_components/purchase_order/warehouse_mis.dart';
import 'package:bar_graph_components/size/util_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'purchase_order/inventory_turnover_graph.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UiSizeConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      key: UiSizeConfig.navKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VendorRatingGraph(
        data: purchaseOrderData,
      ),
      // body: SkillMatrix(heatMapData: purchaseOrderData, graphTitle: ''),
      // body: ListView(
      //   children: [
      //     SizedBox(
      //       height: 400,
      //       child: PurchaseOrderGraphComponent(
      //         heatMapData: purchaseOrderData,
      //         graphTitle: 'Inventory Turnover',
      //       ),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: MSMEStatusGraph(data: msme),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: VendorRatingGraph(
      //         data: purchaseOrderData,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: WareHouseMisGraph(
      //         data: warehouseMis,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: BalanceOrderGraphCompoent(
      //         data: versusData,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: InventoryTurnOver(
      //         graphTitle: '',
      //         heatMapData: purchaseOrderData,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: CommercialBenifits(
      //         data: warehouseMis,
      //       ),
      //     ),
      //     SizedBox(
      //       height: 400,
      //       child: OrderProgressGraph(
      //         data: msme,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

// List<GraphDataItem>

List<GraphDataGroup> versusData = [
  GraphDataGroup(groupName: 'Aug 2023', items: [
    GraphDataItem(
        color: Color(0xffEEBD54),
        kpiValue: '20',
        percentage: 10,
        subGroupId: '',
        title: 'A',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'sd',
        callObjectEvent: []),
    GraphDataItem(
        color: Color(0xff4A88FF),
        kpiValue: '10',
        percentage: 10,
        subGroupId: '',
        title: 'B',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'ed',
        callObjectEvent: []),
    GraphDataItem(
        color: Color(0xff9654F4),
        kpiValue: '40',
        percentage: 10,
        subGroupId: '',
        title: 'B',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'ed',
        callObjectEvent: [])
  ]),
  GraphDataGroup(groupName: 'Sep 2023', items: [
    GraphDataItem(
        color: Color(0xffEEBD54),
        kpiValue: '20',
        percentage: 20,
        subGroupId: '',
        title: 'A',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'sd',
        callObjectEvent: []),
    GraphDataItem(
        color: Color(0xff4A88FF),
        kpiValue: '10',
        percentage: 10,
        subGroupId: '',
        title: 'B',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'ed',
        callObjectEvent: []),
    GraphDataItem(
        color: Color(0xff9654F4),
        kpiValue: '40',
        percentage: 40,
        subGroupId: '',
        title: 'B',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'ed',
        callObjectEvent: [])
  ]),
  GraphDataGroup(groupName: 'Oct 2023', items: [
    GraphDataItem(
        color: Color(0xffEEBD54),
        kpiValue: '20',
        percentage: 20,
        subGroupId: '',
        title: 'A',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'sd',
        callObjectEvent: []),
    GraphDataItem(
        color: Color(0xff4A88FF),
        kpiValue: '10',
        percentage: 10,
        subGroupId: '',
        title: 'B',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'ed',
        callObjectEvent: []),
    GraphDataItem(
        color: Color(0xff9654F4),
        kpiValue: '40',
        percentage: 40,
        subGroupId: '',
        title: 'B',
        sortId: 2,
        subGroupSortId: 23,
        kpiValue2: 'ed',
        callObjectEvent: [])
  ])
];

List<GraphDataItem> purchaseOrderData = [
  GraphDataItem(
    callObjectEvent: [],
    kpiValue2: "10205",
    sortId: 33,
    subGroupSortId: 32,
    color: Colors.purple,
    title: 'Order Shaikh afroz alan paul',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Order Shaikh afroz alan paul',
  ),
  GraphDataItem(
    callObjectEvent: [],
    kpiValue2: "10205",
    sortId: 33,
    subGroupSortId: 32,
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 100,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  GraphDataItem(
    callObjectEvent: [],
    kpiValue2: "10205",
    sortId: 33,
    subGroupSortId: 32,
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  GraphDataItem(
    callObjectEvent: [],
    kpiValue2: "10205",
    sortId: 33,
    subGroupSortId: 32,
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  GraphDataItem(
    callObjectEvent: [],
    kpiValue2: "10205",
    sortId: 33,
    subGroupSortId: 32,
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  GraphDataItem(
    callObjectEvent: [],
    kpiValue2: "10205",
    sortId: 33,
    subGroupSortId: 32,
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
];

List<HeatMapData> msme = [
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 40,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
];

List<HeatMapData> warehouseMis = [
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 40,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 40,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
];

List<HeatMapData> groupedData = [
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 20,
    kpiValue: "10205",
    subGroupId: '1',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: '1',
  ),
  HeatMapData(
    subGroupId: '1',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: '2',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
];

List<HeatMapData> data = [
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 90,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 58,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.yellow,
    title: 'Order Hold ',
    percentage: 44,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.green,
    title: 'Delivery Plan Confirmed ',
    percentage: 32,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),

  //!

  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 90,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 58,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 90,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 58,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.yellow,
    title: 'Order Hold ',
    percentage: 44,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.green,
    title: 'Delivery Plan Confirmed ',
    percentage: 32,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 58,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.yellow,
    title: 'Order Hold ',
    percentage: 44,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.green,
    title: 'Delivery Plan Confirmed ',
    percentage: 32,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 90,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 58,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 18,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blueAccent,
    title: 'Net Balance Order ',
    percentage: 22,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.yellow,
    title: 'Order Hold ',
    percentage: 44,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.green,
    title: 'Delivery Plan Confirmed ',
    percentage: 32,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 90,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  // HeatMapData(
  //   color: Colors.blue,
  //   title: 'MRN Recieved ',
  //   percentage: 58,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.red,
  //   title: 'Order Closed ',
  //   percentage: 18,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blueAccent,
  //   title: 'Net Balance Order ',
  //   percentage: 22,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.yellow,
  //   title: 'Order Hold ',
  //   percentage: 44,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.green,
  //   title: 'Delivery Plan Confirmed ',
  //   percentage: 32,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.purple,
  //   title: 'Total Order ',
  //   percentage: 90,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blue,
  //   title: 'MRN Recieved ',
  //   percentage: 58,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.red,
  //   title: 'Order Closed ',
  //   percentage: 18,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blueAccent,
  //   title: 'Net Balance Order ',
  //   percentage: 22,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.yellow,
  //   title: 'Order Hold ',
  //   percentage: 44,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.green,
  //   title: 'Delivery Plan Confirmed ',
  //   percentage: 32,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.purple,
  //   title: 'Total Order ',
  //   percentage: 90,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blue,
  //   title: 'MRN Recieved ',
  //   percentage: 58,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.red,
  //   title: 'Order Closed ',
  //   percentage: 18,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blueAccent,
  //   title: 'Net Balance Order ',
  //   percentage: 22,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.yellow,
  //   title: 'Order Hold ',
  //   percentage: 44,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.green,
  //   title: 'Delivery Plan Confirmed ',
  //   percentage: 32,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.purple,
  //   title: 'Total Order ',
  //   percentage: 90,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blue,
  //   title: 'MRN Recieved ',
  //   percentage: 58,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.red,
  //   title: 'Order Closed ',
  //   percentage: 18,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blueAccent,
  //   title: 'Net Balance Order ',
  //   percentage: 22,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.yellow,
  //   title: 'Order Hold ',
  //   percentage: 44,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.green,
  //   title: 'Delivery Plan Confirmed ',
  //   percentage: 32,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.purple,
  //   title: 'Total Order ',
  //   percentage: 90,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blue,
  //   title: 'MRN Recieved ',
  //   percentage: 58,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.red,
  //   title: 'Order Closed ',
  //   percentage: 18,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.blueAccent,
  //   title: 'Net Balance Order ',
  //   percentage: 22,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.yellow,
  //   title: 'Order Hold ',
  //   percentage: 44,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // ),
  // HeatMapData(
  //   color: Colors.green,
  //   title: 'Delivery Plan Confirmed ',
  //   percentage: 32,
  //   kpiValue: "10205",
  //   subGroupId: 'Total Order',
  // )
];

List commercial = [
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 40,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.purple,
    title: 'Total Order ',
    percentage: 40,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 63,
    kpiValue: "10205",
  ),
  HeatMapData(
    subGroupId: 'Total Order',
    color: Colors.red,
    title: 'Order Closed ',
    percentage: 20,
    kpiValue: "10205",
  ),
  HeatMapData(
    color: Colors.blue,
    title: 'MRN Recieved ',
    percentage: 60,
    kpiValue: "10205",
    subGroupId: 'Total Order',
  ),
];
