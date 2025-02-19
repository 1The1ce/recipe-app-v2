import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';

import 'trending_recipe_home.dart';

class TrendingRecipeSectionHome extends StatelessWidget {
  const TrendingRecipeSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Trending Recipe", style: TextStyles.homeSectionTitleRedPink),
          TrendingRecipeItemHome(),
        ],
      ),
    );
  }
}
