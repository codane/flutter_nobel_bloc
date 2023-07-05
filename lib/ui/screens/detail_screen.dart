import 'package:flutter/material.dart';
import 'package:flutter_nobel/data/models/laureate_model.dart';
import 'package:flutter_nobel/data/models/nobel_prize_model.dart';
import 'package:flutter_nobel/ui/widgets/biography_container_row.dart';
import 'package:flutter_nobel/ui/widgets/custom_back_button.dart';
import 'package:flutter_nobel/ui/widgets/detail_screen_container.dart';
import 'package:flutter_nobel/ui/widgets/more_info_container.dart';
import 'package:flutter_nobel/ui/widgets/prize_info_row.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.clickedLaureate});

  final LaureateModel? clickedLaureate;

  @override
  Widget build(BuildContext context) {
    final List<NobelPrizeModel>? clickedLaureatePrizes =
        clickedLaureate?.nobelPrizes;

    return Scaffold(
      backgroundColor: const Color(0xffA4C2A5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: (() {
                          Navigator.pop(context);
                        }),
                        child: const CustomBackButton(),
                      ),
                    ],
                  ),
                ),
                DetailScreenContainer(
                    containerTitle: "BIOGRAPHY",
                    containerRows: [
                      BiographyContainerRow(
                        icon: const Icon(Icons.perm_identity),
                        rowText: "${clickedLaureate?.fullName?.en}",
                      ),
                      BiographyContainerRow(
                        icon: const Icon(Icons.date_range),
                        rowText: "${clickedLaureate?.birth?.date}",
                      ),
                      BiographyContainerRow(
                        icon: const Icon(Icons.place),
                        rowText:
                            "${clickedLaureate?.birth?.place?.country?.en}",
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                DetailScreenContainer(
                    containerTitle: "PRIZE INFO",
                    containerRows: [
                      PrizeInfoRow(
                        prizeRowText:
                            "Number of prizes won: ${clickedLaureatePrizes?.length}",
                      ),
                      PrizeInfoRow(
                        prizeRowText:
                            "Category: ${clickedLaureatePrizes?[0].category?.en}",
                      ),
                      PrizeInfoRow(
                        prizeRowText:
                            "Award year: ${clickedLaureatePrizes?[0].awardYear}",
                      ),
                      PrizeInfoRow(
                        prizeRowText:
                            "Prize amount: ${clickedLaureatePrizes?[0].prizeAmount}",
                      ),
                      PrizeInfoRow(
                        prizeRowText:
                            "Reason: ${clickedLaureatePrizes?[0].motivation?.en}",
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                MoreInfoContainer(
                    wikipediaUrl: "${clickedLaureate?.wikipedia?.english}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
