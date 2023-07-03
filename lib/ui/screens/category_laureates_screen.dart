import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nobel/bloc/laureate_bloc.dart';
import 'package:flutter_nobel/data/models/laureate_model.dart';
import 'package:flutter_nobel/ui/screens/detail_screen.dart';
import 'package:flutter_nobel/common/theme/nobel_palette.dart';
import 'package:flutter_nobel/ui/widgets/category_laureates_screen_row.dart';
import 'package:flutter_nobel/ui/widgets/laureate_item.dart';

class CategoryLaureatesScreen extends StatefulWidget {
  const CategoryLaureatesScreen(
      {super.key, required this.categoryAbbreviation});

  final String categoryAbbreviation;

  @override
  State<CategoryLaureatesScreen> createState() =>
      _CategoryLaureatesScreenState();
}

class _CategoryLaureatesScreenState extends State<CategoryLaureatesScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_getAdditionalLaureates);
  }

  void _getAdditionalLaureates() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      context.read<LaureateBloc>().add(LaureateFetched());
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_getAdditionalLaureates)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NobelPalette.nobelGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryLaureatesScreenRow(
                categoryName: widget.categoryAbbreviation,
              ),
              Expanded(
                child: BlocBuilder<LaureateBloc, LaureateState>(
                  builder: (context, state) {
                    switch (state.status) {
                      case LaureateStatus.initial:
                        return const Center(child: CircularProgressIndicator());
                      case LaureateStatus.success:
                        return ListView.builder(
                          controller: _controller,
                          itemCount: state.laureatesList.length + 1,
                          itemBuilder: (context, index) {
                            if (index < state.laureatesList.length) {
                              final LaureateModel currentLaureate =
                                  state.laureatesList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailScreen(
                                          clickedLaureate: currentLaureate),
                                    ),
                                  );
                                },
                                child: LaureateItem(
                                  laureateName:
                                      "${currentLaureate.fullName?.en}",
                                  yearAwarded:
                                      "${currentLaureate.nobelPrizes?[0].awardYear}",
                                ),
                              );
                            } else {
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 30),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          },
                        );
                      case LaureateStatus.failure:
                        return const Center(child: Text("Failure"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
