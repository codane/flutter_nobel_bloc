import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nobel/domain/use_case/get_laureates_use_case.dart';
import 'package:flutter_nobel/presentation/bloc/laureate_bloc.dart';
import 'package:flutter_nobel/presentation/screens/category_laureates_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.categoryAbbreviation});

  final String categoryAbbreviation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LaureateBloc(
          getLaureatesUseCase: GetLaureatesUseCase(),
          categoryAbbreviation: categoryAbbreviation)
        ..add(LaureateFetched()),
        child: CategoryLaureatesScreen(categoryAbbreviation: categoryAbbreviation),
        );
  }
}