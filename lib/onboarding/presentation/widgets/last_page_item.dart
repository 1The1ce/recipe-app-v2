import 'package:flutter/material.dart';

class OnboardingLastPageItem extends StatelessWidget {
  const OnboardingLastPageItem({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Image.network(
        image,
        width: 168,
        height: 168,
        fit: BoxFit.cover,
      ),
    );
  }
}
