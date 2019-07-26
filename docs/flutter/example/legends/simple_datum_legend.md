# Simple Datum Legend Legends Example

![](simple_datum_legend_full.png)

Example:

```
/// Bar chart with series legend example
import 'package:flutter_web/material.dart';
import 'package:charts_flutter_web/flutter.dart' as charts;

class SimpleDatumLegend extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleDatumLegend(this.seriesList, {this.animate});

  factory SimpleDatumLegend.withSampleData() {
    return  SimpleDatumLegend(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  charts.PieChart(
      seriesList,
      animate: animate,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [ charts.DatumLegend()],
    );
  }

  /// Create series list with one series
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
       LinearSales(0, 100),
       LinearSales(1, 75),
       LinearSales(2, 25),
       LinearSales(3, 5),
    ];

    return [
       charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
```
