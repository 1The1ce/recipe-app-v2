import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/auth_view_model.dart';
import 'package:recipe_app/core/core.dart';

class RecipePasswordField extends StatelessWidget {
  const RecipePasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.read<AuthViewModel>();
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: 357 * AppSizes.wRatio,
          height: 41 * AppSizes.hRatio,
          child: TextFormField(
            style: TextStyle(
              fontSize: 16,
              color: AppColors.beigeColor,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
            cursorHeight: 20,
            controller: vm.passwordController,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
              hintText: "●●●●●●●●",
              hintStyle: TextStyle(
                color: AppColors.beigeColor.withValues(alpha: 0.6),
                fontSize: 16,
                height: 1,
              ),
              filled: true,
              fillColor: AppColors.pink,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
            ),
            obscureText: true,
            obscuringCharacter: '●',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              } else if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
