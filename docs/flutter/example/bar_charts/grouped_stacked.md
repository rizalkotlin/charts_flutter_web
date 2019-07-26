# Grouped Stacked Bar Chart Example

![](grouped_stacked_full.png)

Example:

```
/// Example of a bar chart with grouped, stacked series oriented vertically.
import 'package:flutter_web/material.dart';
import 'package:charts_flutter_web/flutter.dart' as charts;

class GroupedStackedBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  GroupedStackedBarChart(this.seriesList, {this.animate});

  factory GroupedStackedBarChart.withSampleData() {
    return  GroupedStackedBarChart(
      createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }


  @override
  Widget build(BuildContext context) {
    return  charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.groupedStacked,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> createSampleData() {
    final desktopSalesDataA = [
       OrdinalSales('2014', 5),
       OrdinalSales('2015', 25),
       OrdinalSales('2016', 100),
       OrdinalSales('2017', 75),
    ];

    final tableSalesDataA = [
       OrdinalSales('2014', 25),
       OrdinalSales('2015', 50),
       OrdinalSales('2016', 10),
       OrdinalSales('2017', 20),
    ];

    final mobileSalesDataA = [
       OrdinalSales('2014', 10),
       OrdinalSales('2015', 15),
       OrdinalSales('2016', 50),
       OrdinalSales('2017', 45),
    ];

    final desktopSalesDataB = [
       OrdinalSales('2014', 5),
       OrdinalSales('2015', 25),
       OrdinalSales('2016', 100),
       OrdinalSales('2017', 75),
    ];

    final tableSalesDataB = [
       OrdinalSales('2014', 25),
       OrdinalSales('2015', 50),
       OrdinalSales('2016', 10),
       OrdinalSales('2017', 20),
    ];

    final mobileSalesDataB = [
       OrdinalSales('2014', 10),
       OrdinalSales('2015', 15),
       OrdinalSales('2016', 50),
       OrdinalSales('2017', 45),
    ];

    return [
       charts.Series<OrdinalSales, String>(
        id: 'Desktop A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataA,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Tablet A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataA,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Mobile A',
        seriesCategory: 'A',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataA,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Desktop B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesDataB,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Tablet B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesDataB,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Mobile B',
        seriesCategory: 'B',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesDataB,
      ),
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
