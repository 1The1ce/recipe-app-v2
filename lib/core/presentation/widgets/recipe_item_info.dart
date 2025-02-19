import 'package:flutter/material.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';
import 'package:recipe_app/core/core.dart';

class RecipeItemInfo extends StatelessWidget {
  const RecipeItemInfo({
    super.key,
    required this.recipe,
  });

  final RecipeModelSmall recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159 * AppSizes.wRatio,
      height: 76 * AppSizes.hRatio,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(14)),
        border: Border.all(color: AppColors.pinkSub, width: 1),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // softWrap: false,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 129 * AppSizes.wRatio,
            child: Text(
              recipe.desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                fontFamily: "League Spartan",
                color: Colors.black,
                height: 1,
              ),
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RecipeRating(rating: recipe.rating),
              RecipeTime(time: recipe.time),
            ],
          ),
        ],
      ),
    );
  }
}
