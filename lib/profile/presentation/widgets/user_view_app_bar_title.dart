import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';

class UserViewAppBarTitle extends StatelessWidget {
  const UserViewAppBarTitle({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<UserViewModel>();
    return SizedBox(
      width: 170,
      height: 102,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 4,
        children: [
          Text(
            softWrap: true,
            maxLines: 1,
            viewModel.user.fullName,
            style: TextStyle(
              color: AppColors.redPinkMain,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            softWrap: true,
            maxLines: 1,
            "@${viewModel.user.username}",
            style: TextStyle(
              color: AppColors.pinkSub,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Text(
            softWrap: true,
            maxLines: 3,
            viewModel.user.presentation,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "League Spartans",
              fontWeight: FontWeight.w300,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
