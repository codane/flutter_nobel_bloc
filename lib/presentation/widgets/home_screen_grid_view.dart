import 'package:flutter/material.dart';
import 'package:flutter_nobel/presentation/widgets/category_card.dart';

class HomeScreenGridView extends StatelessWidget {
  const HomeScreenGridView({super.key, required this.isDesktop});

  final bool isDesktop;

  final List<CategoryCard> categories =const [CategoryCard(
                categoryAbbreviation: "phy",
                categoryTitle: "Physics",
                categorySvg: "assets/physics.svg"),
            CategoryCard(
                categoryAbbreviation: "che",
                categoryTitle: "Chemistry",
                categorySvg: "assets/chemistry.svg"),
            CategoryCard(
                categoryAbbreviation: "med",
                categoryTitle: "Medicine",
                categorySvg: "assets/medicine.svg"),
            CategoryCard(
                categoryAbbreviation: "lit",
                categoryTitle: "Literature",
                categorySvg: "assets/literature.svg"),
            CategoryCard(
                categoryAbbreviation: "pea",
                categoryTitle: "Peace",
                categorySvg: "assets/peace.svg"),
            CategoryCard(
                categoryAbbreviation: "eco",
                categoryTitle: "Economic Sciences",
                categorySvg: "assets/economy.svg"),];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: isDesktop ? GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          children: categories) : GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 15,
          children: categories)
    );
  }
}