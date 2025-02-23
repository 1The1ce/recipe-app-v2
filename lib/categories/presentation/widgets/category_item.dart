import 'package:flutter/material.dart';
import 'package:recipe_app/categories/data/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            model.image,
            width: 158,
            height: 144,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 6,),
        Text(
          model.title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Poppins",
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          softWrap: true,
        ),
      ],
    );
  }
}




class CategoryMainItem extends StatelessWidget {
  const CategoryMainItem({super.key, required this.model});

  final CategoryModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // context.go("categories");
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            model.title,
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            softWrap: true,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              model.image,
              width: double.infinity,
              height: 149,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 6,),

        ],
      ),
    );
  }
}
