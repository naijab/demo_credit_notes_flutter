import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Balance extends StatelessWidget {
  static var formatter = NumberFormat('#,##,###');
  final int usage;
  final int available;

  const Balance({
    Key? key,
    this.usage = 0,
    this.available = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(120),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildLabel(label: "Usage"),
              _buildNumber(total: usage),
            ],
          ),
          const SizedBox(
            width: 90,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildLabel(label: "Available"),
              _buildNumber(total: available),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabel({required String label}) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildNumber({required int total}) {
    return Text(
      formatter.format(total),
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
