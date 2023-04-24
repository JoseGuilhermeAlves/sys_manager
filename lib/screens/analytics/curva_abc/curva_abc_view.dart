import 'dart:async';
import 'dart:io' as IO;
import 'dart:io';

//import 'package:conferencia_de_entrada/screens/oc_table.dart/oc_table_page.dart';
//import 'package:conferencia_de_entrada/utils/services/autenticacao/autenticacao_soap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:sys_manager/controllers/analytics/curva_abc/curva_abc_controller.dart';

import '../../../controllers/analytics/elast_preco/elast_preco_controller.dart';

class CurvaAbc extends StatefulWidget {
  CurvaAbc();

  set servidor(String servidor) {}

  @override
  _CurvaAbcState createState() => _CurvaAbcState();
}

class _CurvaAbcState extends State<CurvaAbc> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  TextEditingController _controllerDialog = TextEditingController();

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _dialogFormKey = GlobalKey<FormState>();
  late TooltipBehavior _tooltipBehavior;
  @override
  void initState() {
    //Get.lazyPut(() => Autenticacao());
    //Get.put(OcTable());
    _tooltipBehavior = TooltipBehavior(enable: true);
    Get.put(CurvaAbcController());
    super.initState();
  }

  checkVersion(var version) async {
    if (IO.Platform.isAndroid) {
      print("its android!");
      /* final newVersion = NewVersion(
        androidId: "br.com.nlphd.PhdInventoryManager",
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

    List<_SalesData> data = [
      _SalesData('Jan', 10.5),
      _SalesData('Fev', 22.3),
      _SalesData('Mar', 25.9),
      _SalesData('Abr', 30.3),
      _SalesData('Mai', 35.0),
      _SalesData('Jun', 35.0),
      _SalesData('Jul', 35.0),
      _SalesData('Ago', 40.0),
      _SalesData('Set', 41.0),
      _SalesData('Out', 41.0),
      _SalesData('Nov', 41.0),
      _SalesData('Dez', 41.0)
    ];
    return Container(
        child: Scaffold(
      appBar: AppBar(
          elevation: 15,
          title: Text(
            'Curva ABC',
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
                child: Row(children: [
                  Column(children: [
                    SizedBox(height: 50),
                    Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.white],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        //height: 100,
                        width: 300,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Produto',
                            hintStyle: TextStyle(color: Colors.grey.shade900),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            fillColor: Colors.grey.shade900,
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 8.0, top: 8.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.grey.shade900),
                              borderRadius: new BorderRadius.circular(25.7),
                            ),
                          ),
                        )),
                    SizedBox(height: 100),
                    Center(
                        child: SfCircularChart(
                            tooltipBehavior: _tooltipBehavior,
                            title: ChartTitle(
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    fontSize: 30),
                                text: 'Oscilação Trimestral'),
                            legend: Legend(isVisible: true),
                            series: <PieSeries<_PieData, String>>[
                          PieSeries<_PieData, String>(
                              explode: true,
                              explodeIndex: 0,
                              dataSource: <_PieData>[
                                _PieData('20%', 21, 'Trimestre 1'),
                                _PieData('25%', 33.5, 'Trimestre 2'),
                                _PieData('30%', 39.3, 'Trimestre 3'),
                                _PieData('35%', 41, 'Trimestre 4')
                              ],
                              xValueMapper: (_PieData data, _) => data.xData,
                              yValueMapper: (_PieData data, _) => data.yData,
                              dataLabelMapper: (_PieData data, _) => data.text,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true)),
                        ])),
                  ]),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.white, Colors.blue.shade400],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight)),
                        child: Column(children: [
                          SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            height: size.height / 2,
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
                                            text: 'Curva ABC - 1 Ano'),
                                        // Enable legend
                                        legend: Legend(isVisible: true),
                                        // Enable tooltip
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <
                                            ChartSeries<_SalesData, String>>[
                                          SplineSeries<_SalesData, String>(
                                              dataSource: data,
                                              xValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.year,
                                              yValueMapper:
                                                  (_SalesData sales, _) =>
                                                      sales.sales,
                                              name: 'Curva ABC',
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
                                )),
                          ),
                        ])),
                  )
                ]),
              )
            ]),
          )
        ]),
      ),
    ));
  }
}

class _PieData {
  _PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String? text;
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
