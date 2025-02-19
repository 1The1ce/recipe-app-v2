import 'package:flutter/material.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/home/presentation/widgets/trending_recipe/trending_recipe_desc_home.dart';
import 'package:recipe_app/home/presentation/widgets/trending_recipe/trending_recipe_title_home.dart';

class TrendingRecipeBottom extends StatelessWidget {
  const TrendingRecipeBottom({
    super.key,
    required this.title,
    required this.desc,
    required this.rating,
    required this.time,
  });

  final String title, desc;
  final num rating;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348 * AppSizes.wRatio,
      height: 49,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        border: Border.all(color: AppColors.pinkSub, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TrendingRecipeTitleHome(title: title),
              RecipeTime(time: time, iconColor: AppColors.pinkSub),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TrendingRecipeDescHome(desc: desc),
              RecipeRating(rating: rating, iconColor: AppColors.pinkSub),
            ],
          ),
        ],
      ),
    );
  }
}
