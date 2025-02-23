import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/recipe_elevated_button.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/profile/presentation/widgets/user_review.dart';

import '../pages/user_view_model.dart';

class UserViewAppBarBottom extends StatelessWidget {
  const UserViewAppBarBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<UserViewModel>();
    return Column(
      spacing: 7,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RecipeElevatedButton(
                text: "Edit Profile",
                callback: () {},
                size: Size(175, 27),
                fontSize: 15),
            RecipeElevatedButton(
              text: "Share Profile",
              callback: () {},
              size: Size(175, 27),
              fontSize: 15,
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.beigeColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.pink, width: 1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserReview(
                  number: viewModel.user.recipesCount, subtitle: "recipes"),
              Container(height: 26, width: 2, color: AppColors.pink),
              UserReview(
                  number: viewModel.user.followingCount, subtitle: "Following"),
              Container(height: 26, width: 2, color: AppColors.pink),
              UserReview(
                  number: viewModel.user.followerCount, subtitle: "Followers"),
            ],
          ),
        ),
        TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppColors.redPinkMain,
          tabs: [
            Text(
              "Recipes",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 12,
              ),
            ),
            Text(
              "Favorites",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontSize: 12,
              ),
            ),
          ],
        ),
        SizedBox(height: 10)
      ],
    );
  }
}
