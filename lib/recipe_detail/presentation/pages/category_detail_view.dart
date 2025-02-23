import 'package:flutter/material.dart';
import 'package:recipe_app/recipe_detail/presentation/manager/category_detail_view_model.dart';
import 'package:recipe_app/recipe_detail/presentation/widgets/category_detail_app_bar.dart';

class CategoryDetailView extends StatelessWidget {
  const CategoryDetailView({super.key, required this.viewModel, required this.categoryId});

  final CategoryDetailViewModel viewModel;
  final int categoryId;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Scaffold(
        appBar: CategoryDetailAppBar(
          vm: viewModel,
        ),
      ),
    );
  }
}
