import 'package:recipe_app/core/client.dart';
import 'package:recipe_app/onboarding/data/models/onboarding_model.dart';

class OnboardingRepository {
  OnboardingRepository({required this.client});

  final ApiClient client;

  List<OnboardingModel> onboardings = [];

  Future<List<OnboardingModel>> fetchOnboardingPages() async {
    if (onboardings.isNotEmpty) return onboardings;
    var rawPages = await client.fetchOnboardingPages();
    onboardings = rawPages.map((page) => OnboardingModel.fromJson(page)).toList();
    return onboardings;
  }
}
