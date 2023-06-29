import 'package:flutter/material.dart';
import 'package:flutter_nobel/common/theme/nobel_palette.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      elevation: 0,
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
          color: NobelPalette.nobelGrey,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}