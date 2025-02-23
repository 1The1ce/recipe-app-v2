import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/recipe_detail/data/models/category_detail_model.dart';

class CategoryDetailRepository {
  final ApiClient apiClient;

  CategoryDetailRepository({
    required this.apiClient,
  });

  List<CategoryDetailModel> recipes = [];

  Future<List<CategoryDetailModel>> fetchRecipes({required int categoryId}) async {
    var recipeData = await apiClient.fetchRecipes(categoryId);
    recipes = recipeData.map((e) => CategoryDetailModel.fromJson(e)).toList();
    return recipes;
  }
}
