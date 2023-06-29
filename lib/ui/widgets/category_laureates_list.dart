import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nobel/bloc/laureate_bloc.dart';
import 'package:flutter_nobel/data/models/laureate_model.dart';
import 'package:flutter_nobel/ui/screens/detail_screen.dart';
import 'package:flutter_nobel/ui/widgets/laureate_item.dart';

class CategoryLaureatesList extends StatelessWidget {
  const CategoryLaureatesList({super.key, required this.loadMoreLauretaes});

  final Function() loadMoreLauretaes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LaureateBloc, LaureateState>(
      builder: (context, state) {
        switch (state.status) {
          case LaureateStatus.initial:
            return const Center(child: CircularProgressIndicator());
          case LaureateStatus.failure:
            return const Center(child: Text("Failure"));
          case LaureateStatus.success:
            return NotificationListener<ScrollEndNotification>(
              onNotification: (scrollPosition) {
                scrollPosition.metrics.pixels ==
                        scrollPosition.metrics.maxScrollExtent
                    ? loadMoreLauretaes()
                    : null;
                return true;
              },
              child: ListView.builder(
                itemCount: state.laureatesList.length,
                itemBuilder: (context, index) {
                  final LaureateModel currentLaureate =
                      state.laureatesList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  clickedLaureate: currentLaureate)));
                    },
                    child: LaureateItem(
                      laureateName: "${currentLaureate.fullName?.en}",
                      yearAwarded:
                          "${currentLaureate.nobelPrizes?[0].awardYear}",
                    ),
                  );
                },
              ),
            );
        }
      },
    );
  }
}
