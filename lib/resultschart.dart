import 'package:dichotic/exampledata.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ResultsChart extends StatelessWidget{
  final List<ExampleData> data;

  ResultsChart(@required this.data);
  @override
  Widget build(BuildContext context) {
    List<charts.Series<ExampleData, String>> result = [
      charts.Series(
          id: "Results",
          data: data,
          domainFn: (ExampleData result, _) => result.id,
          measureFn: (ExampleData result, _) => result.amount,
          //colorFn: (ExampleData result, _) => result.barColor
      )
    ];
    //return charts.BarChart(result,animate: false,);

    return Container(
      height: 300,
      padding: EdgeInsets.all(25),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Column(
            children: <Widget>[
              Text(
                "Result",
              ),
              Expanded(
                child: charts.BarChart(result,animate: false,),
              )
            ],
          ),
        ),
      ),
    );

  }

}