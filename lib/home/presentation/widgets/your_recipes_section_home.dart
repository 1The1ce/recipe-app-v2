import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/home/presentation/manager/home_view_model.dart';
import 'package:recipe_app/home/presentation/widgets/your_recipe_item.dart';

class YourRecipesSectionHome extends StatelessWidget {
  const YourRecipesSectionHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var recipes = context.select<HomeViewModel, List<RecipeModelSmall>>((vm) => vm.yourRecipes);
    return Center(
      child: Container(
        height: 255,
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.redPinkMain,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 9,
          children: [
            Text("Your Recipes", style: TextStyles.homeSectionTitleWhite),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var recipe in recipes) YourRecipeItem(recipe: recipe),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
