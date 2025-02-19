import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/core/core.dart';

import 'categories_horizontal_appbar_bottom.dart';

class RecipeAppbarCatDetail extends StatelessWidget implements PreferredSizeWidget {
  const RecipeAppbarCatDetail({
    super.key,
    required this.title,
    required this.categories,
    required this.selected,
  });

  final String title;
  final List<CategoryModel> categories;
  final CategoryModel selected;

  @override
  Size get preferredSize => const Size(double.infinity, 132);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding38, vertical: 0),
      child: AppBar(
        toolbarHeight: 132,
        leadingWidth: 20,
        leading: RecipeIconButton(
          callback: () => context.pop(),
          image: "assets/icons/back-arrow.svg",
          width: 30,
          height: 14,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.appBarTitleStyle,
        ),
        actions: [
          RecipeIconButtonContainer(
            image: "assets/icons/notification.svg",
            iconColor: AppColors.pinkSub,
            callback: () {},
          ),
          SizedBox(width: 5),
          RecipeIconButtonContainer(
            image: "assets/icons/search.svg",
            iconColor: AppColors.pinkSub,
            callback: () {},
          )
        ],
        bottom: CategoriesHorizontalScrollBar(
          categories: categories,
          selected: selected,
        ),
      ),
    );
  }
}
