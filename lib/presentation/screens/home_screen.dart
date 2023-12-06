import 'package:flutter/material.dart';
import 'package:flutter_nobel/presentation/widgets/home_screen_grid_view.dart';
import 'package:flutter_nobel/presentation/widgets/home_screen_top.dart';
import '../../common/theme/nobel_palette.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 800;
    return  Scaffold(
      backgroundColor: NobelPalette.nobelGreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const HomeScreenTop(),
              Expanded(
                child: HomeScreenGridView(isDesktop: isDesktop,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}