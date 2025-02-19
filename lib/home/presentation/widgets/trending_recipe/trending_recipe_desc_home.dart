import 'package:flutter/material.dart';

class TrendingRecipeDescHome extends StatelessWidget {
  const TrendingRecipeDescHome({
    super.key,
    required this.desc,
  });

  final String desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      child: Text(
        desc,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13, fontFamily: "League Spartan"),
      ),
    );
  }
}
