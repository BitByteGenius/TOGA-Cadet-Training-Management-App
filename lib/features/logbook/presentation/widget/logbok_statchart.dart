import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:toga/core/constant/app_colors.dart';

class LogbookStatChart extends StatelessWidget {
  const LogbookStatChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: PieChart(
        PieChartData(
          startDegreeOffset: 270,
          sectionsSpace: 4,
          centerSpaceRadius: 45,
          sections: [
            // Dual Instruction Hours: 36.3
            PieChartSectionData(
              color: AppColors.neonBlue,
              value: 36.3,
              title: '36.3h',
              radius: 18,
              titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            // Solo Command Flights: 6.2
            PieChartSectionData(
              color: AppColors.cyberTeal,
              value: 6.2,
              title: '6.2h',
              radius: 18,
              titleStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 800),
        curve: Curves.decelerate,
      ),
    );
  }
}