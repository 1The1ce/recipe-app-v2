import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/core/utils/colors.dart';
import 'package:recipe_app/profile/presentation/pages/user_view_model.dart';
import 'package:recipe_app/profile/presentation/widgets/user_view_app_bar_bottom.dart';
import 'package:recipe_app/profile/presentation/widgets/user_view_app_bar_title.dart';

class UserViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const UserViewAppBar({
    super.key,
  });

  @override
  Size get preferredSize => Size(double.infinity, 250);

  @override
  Widget build(BuildContext context) {
    var viewModel = context.watch<UserViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.beigeColor,
        leadingWidth: 102,
        toolbarHeight: 102,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            viewModel.user.profilePhoto,
            width: 100,
            height: 100,
          ),
        ),
        title: UserViewAppBarTitle(),
        actions: [
          Align(
              alignment: Alignment.topCenter,
              child: AppBarAction(child: "assets/svg/plus.svg", onTap: () {})),
          SizedBox(
            width: 4,
          ),
          Align(
              alignment: Alignment.topCenter,
              child: AppBarAction(child: "assets/svg/menu.svg", onTap: () {})),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, double.infinity),
          child: UserViewAppBarBottom(),
        ),
      ),
    );
  }
}
