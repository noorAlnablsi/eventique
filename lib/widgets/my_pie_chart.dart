import '/color.dart';
import 'package:eventique/models/one_cartService.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

final List<Color> colors = [
  const Color.fromARGB(255, 225, 51, 51),
  const Color(0xFFF06292),
  const Color(0xFFBA68C8),
  const Color.fromARGB(255, 25, 124, 205),
  const Color.fromARGB(255, 64, 172, 161),
  const Color(0xFFFFB74D),
  const Color(0xFF9E9D24),
  const Color.fromARGB(255, 200, 179, 238),
  const Color(0xFFFF8A65),
  const Color(0xFF4FC3F7),
];

class MyPieChart extends StatelessWidget {
  const MyPieChart({
    super.key,
    required this.cart,
    required this.totalPriceForOrder,
  });

  final Map<int, OneCartService> cart;
  final double totalPriceForOrder;

  @override
  Widget build(BuildContext context) {
    final sections = cart.entries.map((entry) {
      final cartService = entry.value;
      final percentage = (cartService.totalPrice * 100) / totalPriceForOrder;
      final isSmallPercentage =
          percentage < 5; // Define a threshold for small percentage
      final isSmallVeryPercentage = percentage < 2;

      return PieChartSectionData(
        color: colors[cartService.OneCartServiceId % colors.length],
        value: cartService.totalPrice,
        title: '${percentage.toStringAsFixed(1)}%',
        titleStyle: TextStyle(
          fontSize: isSmallVeryPercentage
              ? 5
              : isSmallPercentage
                  ? 7
                  : 11, // Adjust the font size for small percentages
          fontWeight: FontWeight.bold,
          color: beige,
        ),
        borderSide: BorderSide(
          color: colors[cartService.OneCartServiceId % colors.length]
              .withOpacity(0.9),
          width: 1,
        ),
        radius: 34,
      );
    }).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            maxHeight: 200,
            maxWidth: 200,
          ),
          child: PieChart(
            PieChartData(
              sections: sections,
              sectionsSpace: 3,
              centerSpaceRadius: 60,
            ),
            swapAnimationDuration:
                Duration(milliseconds: 3000), // Duration of the animation
            swapAnimationCurve: Curves.easeInOutQuint, // Animation curve
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 70),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: cart.entries.map((entry) {
                      final cartService = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: colors[cartService.OneCartServiceId %
                                    colors.length],
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${cartService.name}',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'IrishGrover',
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  height: 16,
                  child: IgnorePointer(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(255, 246, 244, 230),
                            Color.fromARGB(35, 255, 253, 240)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
