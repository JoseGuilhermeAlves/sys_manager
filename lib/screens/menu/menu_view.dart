import 'dart:io' as IO;

//import 'package:conferencia_de_entrada/screens/oc_table.dart/oc_table_page.dart';
//import 'package:conferencia_de_entrada/utils/services/autenticacao/autenticacao_soap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:sys_manager/controllers/menu/menu_c_controller.dart';
import 'package:sys_manager/screens/analytics/curva_abc/curva_abc_view.dart';
import 'package:sys_manager/screens/analytics/demanda/demanda_view.dart';
import 'package:sys_manager/screens/analytics/elasticidade_de_preco/elast_de_preco_view.dart';

class Menu extends StatefulWidget {
  Menu();

  set servidor(String servidor) {}

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String _username = '', _password = '';

  String _response = '';

  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  TextEditingController _controllerDialog = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    //Get.lazyPut(() => Autenticacao());
    //Get.put(OcTable());
    Get.put(Demanda());
    Get.put(ElastPreco());
    Get.put(MenuCController());
    super.initState();
  }

  checkVersion(var version) async {
    if (IO.Platform.isAndroid) {
      print("its android!");
      /* final newVersion = NewVersion(
        androidId: "br.com.***.******",
      );

      newVersion.showAlertIfNecessary(context: context);*/
    } else if (IO.Platform.isWindows) {
      /*    updater.updateWindows();
       Directory tempDir = await getTemporaryDirectory();
      File testFile = File(tempDir.path.toString() + "/confirmRelease.txt");
      testFile.writeAsString("FUNCIONA RELEASE");
      updater.updateWindows(version);
      print("Version check!");*/
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<String> menu = Get.find<MenuCController>().menus;

    List<_SalesData> data = [
      _SalesData('Jan', 35),
      _SalesData('Fev', 28),
      _SalesData('Mar', 34),
      _SalesData('Abr', 32),
      _SalesData('Mai', 49)
    ];
    List<_SalesData> data2 = [
      _SalesData('Jan', 12),
      _SalesData('Fev', 22),
      _SalesData('Mar', 48),
      _SalesData('Abr', 5),
      _SalesData('Mai', 46)
    ];
    List<_SalesData> data3 = [
      _SalesData('Jan', 2),
      _SalesData('Fev', 5),
      _SalesData('Mar', 25),
      _SalesData('Abr', 30),
      _SalesData('Mai', 40)
    ];
    return Container(
        child: Scaffold(
      appBar: AppBar(
          elevation: 15,
          title: Text(
            'Menu',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.grey.shade200, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.grey.shade200),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.home),
            color: Colors.grey.shade200,
          ),
          centerTitle: true,
          backgroundColor: Colors.grey.shade800),
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: _globalKey,
        child: Stack(alignment: Alignment.centerLeft, children: <Widget>[
          Positioned(
            left: 0,
            top: 0,
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.white, Colors.blue.shade800],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight)),
                height: size.height, // - (size.height / 11.7),
                width: size.width,
                child: Column(children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(children: [
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(25)),
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.grey.shade100],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight)),
                        width: size.width / 5,
                        height: size.height / 1.151,
                        child: Column(children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0),
                            child: Text(
                              "Análises",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.grey.shade800),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                              height: 471,
                              width: 200,
                              child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Container(
                                      height: 150,
                                      width: 200,
                                      child: Card(
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      settings: RouteSettings(
                                                          name: '/menu'),
                                                      builder: (_) =>
                                                          ElastPreco()));
                                              print(
                                                  'Call Elásticidade de Preço');
                                            },
                                            splashColor: Colors.blueAccent,
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(Icons.monetization_on,
                                                      color:
                                                          Colors.blue.shade800,
                                                      size: 70.0),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    'Previsão de Vendas',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Container(
                                      height: 150,
                                      width: 200,
                                      child: Card(
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      settings: RouteSettings(
                                                          name: '/menu'),
                                                      builder: (_) =>
                                                          Demanda()));
                                              print('Call Previsão de Demanda');
                                            },
                                            splashColor: Colors.blueAccent,
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(Icons.domain_sharp,
                                                      color:
                                                          Colors.blue.shade800,
                                                      size: 70.0),
                                                  Text(
                                                    'Previsão de Demanda',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .grey.shade800,
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                    Container(
                                      height: 150,
                                      width: 200,
                                      child: Card(
                                          elevation: 15,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      settings: RouteSettings(
                                                          name: '/curvaAbc'),
                                                      builder: (_) =>
                                                          CurvaAbc()));
                                              print('Call Curva ABC');
                                            },
                                            splashColor: Colors.blueAccent,
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Icon(Icons.analytics,
                                                      size: 70.0,
                                                      color:
                                                          Colors.blue.shade800),
                                                  Text('Curva ABC',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ],
                                              ),
                                            ),
                                          )),
                                    ),
                                  ])),
                        ])),
                    SizedBox(
                      width: 39,
                    ),
                    Expanded(
                      child: Column(children: [
                        SingleChildScrollView(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          child: Container(
                            height: 100,
                            child: DataTable(
                                dividerThickness: 5,
                                headingTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                                headingRowColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected))
                                    return Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.08);
                                  return Colors.black; // Use the default value.
                                }),
                                headingRowHeight: 40,
                                dataTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                dataRowHeight: 35,
                                dataRowColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.selected))
                                    return Theme.of(context)
                                        .colorScheme
                                        .primary
                                        .withOpacity(0.08);
                                  return Colors.blueGrey
                                      .shade100; // Use the default value.
                                }),
                                columns: Get.find<MenuCController>().getColumns(
                                    Get.find<MenuCController>().listColumns),
                                rows: Get.find<MenuCController>().getRows(
                                    Get.find<MenuCController>().listDummy)),
                          ),
                        ),
                        SizedBox(height: 50),
                        Container(
                            height: 358,
                            width: 900,
                            child: Card(
                                elevation: 15,
                                child: Expanded(
                                  child: Column(children: [
                                    //
                                    //Initialize the chart widget
                                    SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        // Chart title
                                        title: ChartTitle(
                                            text:
                                                'Análises meio ano de vendas - Top 3'),
                                        // Enable legend
                                        legend: Legend(isVisible: true),
                                        // Enable tooltip
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <
                                            ChartSeries<_SalesData, String>>[
                                          LineSeries<_SalesData, String>(
                                              dataSource: data,
                                              xValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.sales,
                                              name: 'Top 1',
                                              // Enable data label
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true)),
                                          LineSeries<_SalesData, String>(
                                              dataSource: data2,
                                              xValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.sales,
                                              name: 'Top 2',
                                              // Enable data label
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true)),
                                          LineSeries<_SalesData, String>(
                                              dataSource: data3,
                                              xValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.sales,
                                              name: 'Top 3',
                                              // Enable data label
                                              dataLabelSettings:
                                                  DataLabelSettings(
                                                      isVisible: true))
                                        ]),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        //Initialize the spark charts widget
                                        child: SfSparkLineChart.custom(
                                          //Enable the trackball
                                          trackball: SparkChartTrackball(
                                              activationMode:
                                                  SparkChartActivationMode.tap),
                                          //Enable marker
                                          marker: SparkChartMarker(
                                              displayMode:
                                                  SparkChartMarkerDisplayMode
                                                      .all),
                                          //Enable data label
                                          labelDisplayMode:
                                              SparkChartLabelDisplayMode.all,
                                          xValueMapper: (int index) =>
                                              data[index].year,
                                          yValueMapper: (int index) =>
                                              data[index].sales,
                                          dataCount: 5,
                                        ),
                                      ),
                                    )
                                  ]),
                                ))),
                        /*decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(
                                            "assets/glossy-machine-learning.png"),
                                        fit: BoxFit.fitWidth,
                                      ))*/
                      ]),
                    ),
                  ]),
                ]),
              )
            ]),
          )
        ]),
      ),
    ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
