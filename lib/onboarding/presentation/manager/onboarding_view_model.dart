import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_app/onboarding/data/models/onboarding_model.dart';
import 'package:recipe_app/onboarding/data/repositories/onboarding_repository.dart';

class OnboardingViewModel extends ChangeNotifier {
  OnboardingViewModel({required OnboardingRepository repo}) : _repo = repo {
    load();
  }

  final PageController controller = PageController();

  final OnboardingRepository _repo;

  List<OnboardingModel> onboardings = [];

  Future<void> load() async {
    onboardings = await _repo.fetchOnboardingPages();
    notifyListeners();
  }

  void pageChangedCallBack(int index, BuildContext context) {
    if (index >= onboardings.length) {
      context.go('/');
    }
  }
}
