import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/core/core.dart';
import 'package:recipe_app/profile/presentation/widgets/profile_app_bar.dart';
import 'package:recipe_app/profile/presentation/manager/profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(repo: context.read(), recipeRepo: context.read()),
      builder: (context, child) {
        var isLoading = context.select((ProfileViewModel vm) => vm.loading);
        return DefaultTabController(
          length: 2,
          child: switch (isLoading) {
            true => Center(child: CircularProgressIndicator()),
            false => ProfileScaffold(),
          },
        );
      },
    );
  }
}

class ProfileScaffold extends StatelessWidget {
  const ProfileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var recipes = context.select((ProfileViewModel vm)=>vm.recipes);
    return Scaffold(
      extendBody: true,
      appBar: const ProfileAppBar(),
      body: TabBarView(
        children: [
          GridView.builder(
            padding: EdgeInsets.fromLTRB(AppSizes.padding36, 20, AppSizes.padding36, 100),
            itemCount: recipes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 226,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) => RecipeItem(
              recipe: recipes[index],
              goBackRoute: '/profile/me',
            ),
          ),
          SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: RecipeBottomNavigationBar(),
    );
  }
}
