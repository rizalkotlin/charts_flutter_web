# Bar Secondary Axis Only Axes Example

![](bar_secondary_axis_only_full.png)

Example:

```
/// Bar chart example
import 'package:flutter_web/material.dart';
import 'package:charts_flutter_web/flutter.dart' as charts;

/// Example of using only a secondary axis (on the right) for a set of grouped
/// bars.
///
/// Both series plots using the secondary axis due to the measureAxisId of
/// secondaryMeasureAxisId.
///
/// Note: secondary may flip left and right positioning when
/// RTL.flipAxisLocations is set.
class BarChartWithSecondaryAxisOnly extends StatelessWidget {
  static const secondaryMeasureAxisId = 'secondaryMeasureAxisId';
  final List<charts.Series> seriesList;
  final bool animate;

  BarChartWithSecondaryAxisOnly(this.seriesList, {this.animate});

  factory BarChartWithSecondaryAxisOnly.withSampleData() {
    return  BarChartWithSecondaryAxisOnly(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final globalSalesData = [
       OrdinalSales('2014', 500),
       OrdinalSales('2015', 2500),
       OrdinalSales('2016', 1000),
       OrdinalSales('2017', 7500),
    ];

    return [
       charts.Series<OrdinalSales, String>(
        id: 'Global Revenue',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: globalSalesData,
      )
        // Set series to use the secondary measure axis.
        ..setAttribute(charts.measureAxisIdKey, secondaryMeasureAxisId),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
```
