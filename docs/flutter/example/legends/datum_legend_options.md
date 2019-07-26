# Datum Legend Options Legends Example

![](datum_legend_options_full.png)

Example:

```
/// Pie chart with example of a legend with customized position, justification,
/// desired max rows, padding, and entry text styles. These options are shown as
/// an example of how to use the customizations, they do not necessary have to
/// be used together in this way. Choosing [end] as the position does not
/// require the justification to also be [endDrawArea].
import 'package:flutter_web/material.dart';
import 'package:charts_flutter_web/flutter.dart' as charts;

class DatumLegendOptions extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DatumLegendOptions(this.seriesList, {this.animate});

  factory DatumLegendOptions.withSampleData() {
    return  DatumLegendOptions(
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
      // Add the legend behavior to the chart to turn on legends.
      // This example shows how to change the position and justification of
      // the legend, in addition to altering the max rows and padding.
      behaviors: [
         charts.DatumLegend(
          // Positions for "start" and "end" will be left and right respectively
          // for widgets with a build context that has directionality ltr.
          // For rtl, "start" and "end" will be right and left respectively.
          // Since this example has directionality of ltr, the legend is
          // positioned on the right side of the chart.
          position: charts.BehaviorPosition.end,
          // For a legend that is positioned on the left or right of the chart,
          // setting the justification for [endDrawArea] is aligned to the
          // bottom of the chart draw area.
          outsideJustification: charts.OutsideJustification.endDrawArea,
          // By default, if the position of the chart is on the left or right of
          // the chart, [horizontalFirst] is set to false. This means that the
          // legend entries will grow as  rows first instead of a  column.
          horizontalFirst: false,
          // By setting this value to 2, the legend entries will grow up to two
          // rows before adding a  column.
          desiredMaxRows: 2,
          // This defines the padding around each legend entry.
          cellPadding:  EdgeInsets.only(right: 4.0, bottom: 4.0),
          // Render the legend entry text with custom styles.
          entryTextStyle: charts.TextStyleSpec(
              color: charts.MaterialPalette.purple.shadeDefault,
              fontFamily: 'Georgia',
              fontSize: 11),
        )
      ],
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
