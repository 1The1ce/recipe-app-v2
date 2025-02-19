import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_continue_button.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_image_and_gradient.dart';
import 'package:recipe_app/onboarding/presentation/manager/onboarding_view_model.dart';

class OnboardingTitleAndSubtitle extends StatelessWidget {
  const OnboardingTitleAndSubtitle({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnboardingViewModel>();
    return Positioned(
      top: 72,
      left: AppSizes.padding38,
      child: Column(
        spacing: 14,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            vm.onboardings[index].title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            vm.onboardings[index].subtitle,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
