import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/home/presentation/manager/home_view_model.dart';

class RecentlyAddedSectionHome extends StatelessWidget {
  const RecentlyAddedSectionHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeViewModel, List<RecipeModelSmall>>(
      selector: (context, vm) => vm.yourRecipes,
      builder: (context, recipes, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 9,
          children: [
            Text("Recently Added", style: TextStyles.homeSectionTitleRedPink),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var recipe in recipes) RecipeItem(recipe: recipe),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
