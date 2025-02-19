import 'package:flutter/material.dart';

class ProfileAppBarStatsColumn extends StatelessWidget {
  const ProfileAppBarStatsColumn({
    super.key,
    required this.number,
    required this.label,
  });

  final int number;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          number.toString(),
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, height: 1),
        ),
      ],
    );
  }
}
