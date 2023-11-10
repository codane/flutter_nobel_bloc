import 'package:flutter/material.dart';
import 'package:flutter_nobel/common/theme/nobel_palette.dart';

class LaureateItem extends StatelessWidget {
  const LaureateItem(
      {super.key, required this.laureateName, required this.yearAwarded});

  final String laureateName;
  final String yearAwarded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Material(
        elevation: 0,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ListTile(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          tileColor: NobelPalette.nobelGrey,
          title: Text(laureateName),
          titleTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          subtitle: Text(yearAwarded),
          trailing: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}