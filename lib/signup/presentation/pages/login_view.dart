import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/auth_view_model.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/core/secure_storage.dart';
import 'package:recipe_app/signup/presentation/pages/recipe_password_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.read<AuthViewModel>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 152),
          Form(
            key: vm.formKey,
            child: Center(
              child: Column(
                children: [
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        width: 357 * AppSizes.wRatio,
                        height: 41 * AppSizes.hRatio,
                        child: TextFormField(
                          controller: vm.loginController,
                          textAlignVertical: TextAlignVertical.top,
                          cursorHeight: 20,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.beigeColor,
                            fontWeight: FontWeight.w500,
                            height: 1,
                          ),
                          decoration: InputDecoration(
                            hintText: "login",
                            hintStyle: TextStyle(
                              color: AppColors.beigeColor.withValues(alpha: 0.6),
                              fontSize: 16,
                              height: 1,
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: AppSizes.padding36),
                            filled: true,
                            fillColor: AppColors.pink,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  RecipePasswordField(),
                  SizedBox(height: 90),
                  RecipeElevatedButton(
                    text: "Login",
                    callback: () async {
                      if (await vm.submitForm() && context.mounted) {
                        context.go('/');
                      }
                    },
                    size: const Size(207, 45),
                  ),
                  SizedBox(height: 27),
                  RecipeElevatedButton(
                    text: "Sign Up",
                    callback: () async {
                      await SecureStorage.deleteToken();
                    },
                    size: const Size(207, 45),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
