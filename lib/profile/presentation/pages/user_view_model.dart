import 'package:flutter/material.dart';
import 'package:recipe_app/profile/data/models/user_model.dart';
import 'package:recipe_app/profile/data/repositories/user_repository.dart';
import 'package:recipe_app/recipe_detail/data/models/category_detail_model.dart';
import 'package:recipe_app/recipe_detail/data/repositories/category_detail_repository.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository _repo;
  final CategoryDetailRepository _recipeRepo;
  final int userId;
  late UserModel user;
  late List<CategoryDetailModel> recipeModels;
  bool loading = true;

  UserViewModel(
      {required UserRepository repo,
      required this.userId,
      required CategoryDetailRepository recipeRepo})
      : _repo = repo,
        _recipeRepo = recipeRepo {
    load();
  }

  Future<void> load() async {
    loading = true;
    notifyListeners();
    user = await _repo.fetchUser(userId);
    recipeModels = await _recipeRepo.fetchRecipes(categoryId: 1);
    loading = false;
    notifyListeners();
  }
}
