import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_continue_button.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_image_and_gradient.dart';
import 'package:recipe_app/onboarding/presentation/widgets/onboarding_title_and_subtitle.dart';
import 'package:recipe_app/onboarding/presentation/manager/onboarding_view_model.dart';

class OnboardingViewBackArrow extends StatelessWidget {
  const OnboardingViewBackArrow({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: index != 0,
      child: Positioned(
        top: 20,
        left: 16,
        child: IconButton(
          onPressed: () => context.read<OnboardingViewModel>().controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              ),
          icon: SvgPicture.asset("assets/icons/back-arrow.svg"),
        ),
      ),
    );
  }
}
