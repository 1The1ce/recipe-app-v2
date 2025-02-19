import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/onboarding/presentation/manager/onboarding_view_model.dart';

class OnboardingContinueButton extends StatelessWidget {
  const OnboardingContinueButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 48),
      child: RecipeElevatedButton(
        text: "Continue",
        callback: () => context.read<OnboardingViewModel>().controller.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        ),
      ),
    );
  }
}
