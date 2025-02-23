import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/core/presentation/widgets/app_bar_action.dart';
import 'package:recipe_app/recipe_detail/presentation/manager/category_detail_view_model.dart';

import '../../../core/utils/colors.dart';

class CategoryDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CategoryDetailAppBar({super.key, required this.vm});

  final CategoryDetailViewModel vm;

  @override
  Size get preferredSize => Size(double.infinity, 41);

  @override
  Widget build(BuildContext context) {
    vm.load();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        backgroundColor: AppColors.beigeColor,
        leading: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: 21,
            height: 14,
            child: SvgPicture.asset(
              "assets/svg/back.svg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        leadingWidth: 23,
        title: Text(
          vm.categories[vm.categoryId].title,
          style: TextStyle(
            color: AppColors.redPinkMain,
            fontFamily: "Poppins",
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          AppBarAction(child: "assets/svg/notification.svg", onTap: () {}),
          SizedBox(width: 3,),
          AppBarAction(child: "assets/svg/search.svg", onTap: () {})
        ],
      ),
    );
  }
}
