import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/widgets/profile_app_bar_bottom.dart';
import 'package:recipe_app/profile/presentation/manager/profile_view_model.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Size get preferredSize => Size(double.infinity, 260);

  @override
  Widget build(BuildContext context) {
    var myProfile = context.select((ProfileViewModel vm)=>vm.myProfile);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.padding36, vertical: 10),
      child: AppBar(
        toolbarHeight: 102 * AppSizes.hRatio,
        leadingWidth: 102 * AppSizes.wRatio,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(51),
          child: Image.network(
            myProfile!.image,
            fit: BoxFit.cover,
          ),
        ),
        title: Column(
          spacing: 3,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myProfile.fullName,
              style: TextStyle(
                color: AppColors.redPinkMain,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "@${myProfile.username}",
              style: TextStyle(color: AppColors.pinkSub, fontSize: 12),
            ),
            Text(
              myProfile.bio,
              maxLines: 3,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "League Spartan",
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        actions: [
          Align(
            alignment: Alignment.topCenter,
            child: RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              callback: () {},
            ),
          ),
          SizedBox(width: 5),
          Align(
            alignment: Alignment.topCenter,
            child: RecipeIconButtonContainer(
              image: "assets/icons/heart.svg",
              callback: () {},
            ),
          ),
        ],
        bottom: ProfileAppBarBottom(),
      ),
    );
  }
}
