# Outside Label Pie Chart Example

![](outside_label_full.png)

Example:

```
/// Simple pie chart with outside labels example.
import 'package:charts_flutter_web/flutter.dart' as charts;
import 'package:flutter_web/material.dart';

class PieOutsideLabelChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieOutsideLabelChart(this.seriesList, {this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory PieOutsideLabelChart.withSampleData() {
    return  PieOutsideLabelChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  charts.PieChart(seriesList,
        animate: animate,
        // Add an [ArcLabelDecorator] configured to render labels outside of the
        // arc with a leader line.
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //        charts.ArcLabelDecorator(
        //          insideLabelStyleSpec:  charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec:  charts.TextStyleSpec(...)),
        defaultRenderer:  charts.ArcRendererConfig(arcRendererDecorators: [
           charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ]));
  }

  /// Create one series with sample hard coded data.
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
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
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
