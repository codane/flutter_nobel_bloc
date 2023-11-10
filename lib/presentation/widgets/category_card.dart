import 'package:flutter/material.dart';
import 'package:flutter_nobel/common/theme/nobel_palette.dart';
import 'package:flutter_nobel/presentation/screens/category_screen.dart';
import 'package:flutter_svg/svg.dart';


class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key, required this.categoryAbbreviation, required this.categoryTitle, required this.categorySvg});

  final String categoryAbbreviation;
  final String categoryTitle;
  final String categorySvg;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //ref.watch(categoryAbbreviationProvider.notifier).state = categoryAbbreviation;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen(categoryAbbreviation: categoryAbbreviation)),
        );
      },
      child: GridTile(
        header: GridTileBar(
          title: Text(
            categoryTitle,
            style: const TextStyle(color: Colors.black),
            ),
        ),
        child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(20),),
          child: Container(
            decoration: const BoxDecoration(
              color: NobelPalette.nobelGrey,
              borderRadius: BorderRadius.all(Radius.circular(20),),
            ), 
            child: SvgPicture.asset(categorySvg),
          ),
        ),
      ),
    );
  }
}