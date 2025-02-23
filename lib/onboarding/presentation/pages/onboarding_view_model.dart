import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';
import 'package:recipe_app/categories/data/repositories/categories_repository.dart';
import 'package:recipe_app/onboarding/data/models/onboarding_model.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel(
      {required OnboardingRepository repo,
      required CategoriesRepository cateRepo})
      : _repo = repo,
        _cateRepo = cateRepo {
    load();
  }

  final PageController controller = PageController();

  final OnboardingRepository _repo;

  final CategoriesRepository _cateRepo;
  List<OnboardingModel> onboardings = [];
  List<CategoryModel> categories = [];

  Future<void> load() async {
    onboardings = await _repo.fetchOnboardingPages();
    categories = await _cateRepo.fetchCategories();
    notifyListeners();
  }

  void goToLastPage() {
    if (controller.hasClients) {
      controller.animateToPage(
        onboardings.length - 1,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void pageChangedCallBack(int index, BuildContext context) {
    if (index == onboardings.length) {
      context.go('/welcome');
    }
  }
}
