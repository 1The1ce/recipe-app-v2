import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_continue_button.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_image_and_gradient.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_title_and_subtitle.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_view_back_arrow.dart';
import 'package:recipe_app/onboarding/presentation/manager/onboarding_view_model.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardingViewModel>(
      create: (context) => OnboardingViewModel(repo: context.read()),
      builder: (context, child) {
        final vm = context.watch<OnboardingViewModel>();
        return Scaffold(
          body: PageView.builder(
            controller: vm.controller,
            itemCount: vm.onboardings.length + 1,
            itemBuilder: (context, index) {
              if (index >= vm.onboardings.length) return Center(child: CircularProgressIndicator());

              return Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  OnboardingTitleAndSubtitle(index: index),
                  OnboardingImageAndGradient(index: index),
                  BottomShadow(),
                  OnboardingContinueButton(),
                  OnboardingViewBackArrow(index: index),
                ],
              );
            },
            onPageChanged: (index) => vm.pageChangedCallBack(index, context),
          ),
        );
      },
    );
  }
}
