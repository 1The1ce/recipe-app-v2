import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/onboarding/presentation/manager/onboarding_view_model.dart';

class OnboardingImageAndGradient extends StatelessWidget {
  const OnboardingImageAndGradient({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OnboardingViewModel>();
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.network(
          vm.onboardings[index].image,
          width: double.infinity,
          height: 741 * AppSizes.hRatio,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          height: 284 * AppSizes.hRatio,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.8],
              colors: [
                AppColors.beigeColor,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
