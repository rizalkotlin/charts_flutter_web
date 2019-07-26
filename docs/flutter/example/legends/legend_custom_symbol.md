# Legend Custom Symbol Legends Example

![](legend_custom_symbol_full.png)

Example:

```
/// Bar chart with custom symbol in legend example.
import 'package:flutter_web/material.dart';
import 'package:charts_flutter_web/flutter.dart' as charts;

/// Example custom renderer that renders [IconData].
///
/// This is used to show that legend symbols can be assigned a custom symbol.
class IconRenderer extends charts.SymbolRenderer {
  final IconData iconData;

  IconRenderer(this.iconData);

  @override
  Widget build(BuildContext context,
      {Size size, Color color, bool isSelected}) {
    return  SizedBox.fromSize(
        size: size, child:  Icon(iconData, color: color, size: 12.0));
  }
}

class LegendWithCustomSymbol extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  LegendWithCustomSymbol(this.seriesList, {this.animate});

  factory LegendWithCustomSymbol.withSampleData() {
    return  LegendWithCustomSymbol(
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
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the legend behavior to the chart to turn on legends.
      // By default the legend will display above the chart.
      //
      // To change the symbol used in the legend, set the renderer attribute of
      // symbolRendererKey to a SymbolRenderer.
      behaviors: [ charts.SeriesLegend()],
      defaultRenderer:  charts.BarRendererConfig(
          symbolRenderer:  IconRenderer(Icons.cloud)),
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
       OrdinalSales('2014', 5),
       OrdinalSales('2015', 25),
       OrdinalSales('2016', 100),
       OrdinalSales('2017', 75),
    ];

    final tabletSalesData = [
       OrdinalSales('2014', 25),
       OrdinalSales('2015', 50),
       OrdinalSales('2016', 10),
       OrdinalSales('2017', 20),
    ];

    final mobileSalesData = [
       OrdinalSales('2014', 10),
       OrdinalSales('2015', 15),
       OrdinalSales('2016', 50),
       OrdinalSales('2017', 45),
    ];

    final otherSalesData = [
       OrdinalSales('2014', 20),
       OrdinalSales('2015', 35),
       OrdinalSales('2016', 15),
       OrdinalSales('2017', 10),
    ];

    return [
       charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
       charts.Series<OrdinalSales, String>(
        id: 'Other',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: otherSalesData,
      )
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
