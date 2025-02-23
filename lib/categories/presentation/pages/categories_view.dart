import 'package:flutter/material.dart';
import 'package:recipe_app/categories/presentation/pages/categories_view_model.dart';
import 'package:recipe_app/categories/presentation/widgets/categories_app_bar.dart';
import 'package:recipe_app/categories/presentation/widgets/category_item.dart';
import 'package:recipe_app/core/utils/colors.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.viewModel});

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) => Scaffold(
              backgroundColor: AppColors.beigeColor,
              extendBody: true,
              body: viewModel.categories.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: CategoryMainItem(
                                model: viewModel.mainCategory!)),
                        SizedBox(
                          height: 3,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          itemCount: viewModel.categories.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => (!viewModel
                                  .categories[index].main)
                              ? CategoryItem(model: viewModel.categories[index])
                              : null,
                        ),
                      ],
                    ),
              appBar: CategoriesAppBar(),
            ));
  }
}
