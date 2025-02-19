import 'package:recipe_app/categories_detail/data/models/recipe_model_small.dart';

import '../../client.dart';

class RecipeRepository {
  RecipeRepository({required this.client});

  final ApiClient client;
  List<RecipeModelSmall> yourRecipes = [];
  List<RecipeModelSmall> recentRecipes = [];

  RecipeModelSmall? trendingRecipe;

  Future<RecipeModelSmall?> fetchTrendingRecipe() async {
    var rawRecipe = await client.fetchTrendingRecipe();
    trendingRecipe = RecipeModelSmall.fromJson(rawRecipe);
    return trendingRecipe;
  }

  Future<List<RecipeModelSmall>> fetchYourRecipes(int limit) async {
    // if (yourRecipes.isNotEmpty) return yourRecipes;
    var rawRecipes = await client.fetchYourRecipes(limit);
    yourRecipes = rawRecipes.map((recipe) => RecipeModelSmall.fromJson(recipe)).toList();
    return yourRecipes;
  }

  Future<List<RecipeModelSmall>> fetchRecentRecipes(int limit) async {
    // if (recentRecipes.isNotEmpty) return recentRecipes;

    var rawRecipes = await client.fetchRecentRecipes(limit);
    recentRecipes = rawRecipes.map((recipe) => RecipeModelSmall.fromJson(recipe)).toList();
    return recentRecipes;
  }
}
