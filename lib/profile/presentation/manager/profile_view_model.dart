import 'package:flutter/material.dart';
import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/data/models/profile_model.dart';
import 'package:recipe_app/profile/data/repositories/profile_repository.dart';

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel({
    required ProfileRepository repo,
    required RecipeRepository recipeRepo,
  })  : _profileRepo = repo,
        _recipeRepo = recipeRepo {
    load();
  }

  bool loading = true;
  final ProfileRepository _profileRepo;
  final RecipeRepository _recipeRepo;

  ProfileModel? myProfile;
  List<RecipeModelSmall> recipes = [];

  Future<void> load() async {
    loading = true;
    notifyListeners();

    myProfile = await _profileRepo.fetchMyProfile();
    recipes = await _recipeRepo.fetchYourRecipes(20);
    loading = false;
    notifyListeners();
  }
}
