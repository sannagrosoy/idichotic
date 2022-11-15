import 'package:charts_flutter/flutter.dart' as charts;
//import 'package:flutter/foundation.dart';

class ExampleData {
  final int amount;
  final int n;
  final String id;
  final charts.Color barColor;

  ExampleData(
      {
        required this.amount,
        required this.n,
        required this.id,
        required this.barColor,
      }
      );
}