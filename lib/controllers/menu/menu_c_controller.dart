import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sys_manager/models/oc_model.dart';

class MenuCController extends GetxController {
  MenuCController();

  List<String> menus = [
    'Previsão de Vendas',
    'Previsão de Demanda',
    'Curva ABC'
  ];

  final listColumns = ['Código', 'CNPJ', 'Data inc.', 'Fornecedor', '%'];
  final listDummy = <OC>[
    OC(
        ocNum: '170456',
        cnpj: '31028264911000',
        fornecedor: '[28028264912950] - Fornec.',
        emissao: '09/02/2014 16:18',
        nota: '% 40'),
    OC(
        ocNum: '170456',
        cnpj: '31028264911000',
        fornecedor: '[28028264912950] - Fornec.',
        emissao: '09/02/2014 16:18',
        nota: '% 32'),
    OC(
        ocNum: '170456',
        cnpj: '31028264911000',
        fornecedor: '[28028264912950] - Fornec.',
        emissao: '09/02/2014 16:18',
        nota: '% 28'),
  ];

  List<DataColumn> getColumns(List<String> columns) =>
      columns.map((String column) => DataColumn(label: Text(column))).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  List<DataRow> getRows(List<OC> rows) => rows.map((OC row) {
        final cells = [
          row.ocNum,
          row.cnpj,
          row.emissao,
          row.fornecedor,
          row.nota
        ];
        return DataRow(selected: true, cells: getCells(cells));
      }).toList();
}
