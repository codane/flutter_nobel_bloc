import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nobel/bloc/laureate_bloc.dart';
import 'package:flutter_nobel/data/repositories/nobel_repository.dart';
import 'package:flutter_nobel/ui/screens/category_laureates_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryAbbreviation});

  final String categoryAbbreviation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LaureateBloc(
          repository: NobelRepository(),
          categoryAbbreviation: categoryAbbreviation)
        ..add(LaureateFetched()),
        child: CategoryLaureatesScreen(categoryAbbreviation: categoryAbbreviation),
        );
  }
}