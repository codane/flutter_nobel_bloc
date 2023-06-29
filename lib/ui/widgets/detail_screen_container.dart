import 'package:flutter/material.dart';
import 'package:flutter_nobel/common/theme/nobel_palette.dart';

class DetailScreenContainer extends StatelessWidget {
  const DetailScreenContainer({super.key, required this.containerTitle, required this.containerRows});

  final String containerTitle;
  final List<Widget> containerRows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: NobelPalette.nobelGrey,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  containerTitle,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          ...containerRows,
        ],
      ),
    );
  }
}