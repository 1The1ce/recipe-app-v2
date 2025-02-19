import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';

class TrendingRecipeTitleHome extends StatelessWidget {
  const TrendingRecipeTitleHome({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245 * AppSizes.wRatio,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
