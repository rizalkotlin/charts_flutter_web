# Dash Pattern Line Chart Example

![](dash_pattern_full.png)

Example:

```
/// Dash pattern line chart example
import 'package:charts_flutter_web/flutter.dart' as charts;
import 'package:flutter_web/material.dart';

/// Example of a line chart rendered with dash patterns.
class DashPatternLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DashPatternLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory DashPatternLineChart.withSampleData() {
    return  DashPatternLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  charts.LineChart(seriesList, animate: animate);
  }

  /// Create three series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
       LinearSales(0, 5),
       LinearSales(1, 25),
       LinearSales(2, 100),
       LinearSales(3, 75),
    ];

    var myFakeTabletData = [
       LinearSales(0, 10),
       LinearSales(1, 50),
       LinearSales(2, 200),
       LinearSales(3, 150),
    ];

    var myFakeMobileData = [
       LinearSales(0, 15),
       LinearSales(1, 75),
       LinearSales(2, 300),
       LinearSales(3, 225),
    ];

    return [
       charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
       charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        dashPattern: [2, 2],
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
       charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        dashPattern: [8, 3, 2, 3],
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
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
