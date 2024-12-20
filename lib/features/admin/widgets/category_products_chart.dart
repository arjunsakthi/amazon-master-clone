import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/features/admin/models/sales.dart';

class CategoryProductsChart extends StatelessWidget {
  final List<Sales> earnings;

  const CategoryProductsChart({
    super.key,
    required this.earnings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          barGroups: earnings
              .map(
                (sales) => BarChartGroupData(
                  x: earnings.indexOf(sales),
                  barRods: [
                    BarChartRodData(
                      toY: sales.earnings.toDouble(),
                      color: Colors.blue,
                      width: 16,
                    ),
                  ],
                ),
              )
              .toList(),
          titlesData: FlTitlesData(
            // leftTitles: const AxisTitles(
            //   sideTitles: SideTitles(showTitles: true),
            // ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(
                    earnings[value.toInt()].label,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }
}
