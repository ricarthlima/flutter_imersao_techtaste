import 'package:flutter/material.dart';
import 'package:flutter_imersao_techtaste/models/category.dart';
import 'package:flutter_imersao_techtaste/ui/_core/app_colors.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel category;
  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.backgroundLightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 6,
        children: [
          Image.asset(
            category.imagePath,
            height: 48,
          ),
          Text(
            category.name,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          )
        ],
      ),
    );
  }
}
