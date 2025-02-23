import 'package:flutter/material.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoriesRepository _repo;

  List<CategoryModel> categories = [];
  CategoryModel? mainCategory;

  CategoriesViewModel({required CategoriesRepository repo}) : _repo = repo{
    load();
  }

  void load() async {
    categories = await _repo.fetchCategories();
    mainCategory = categories.where((category) => category.main).firstOrNull;
    notifyListeners();
  }
}
