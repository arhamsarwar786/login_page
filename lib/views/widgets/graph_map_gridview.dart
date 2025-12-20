import 'package:flutter/material.dart';
import 'package:login_page/model/bottom_card_model.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/views/widgets/chart_card.dart';

class GraphMapGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  GraphMapGridView(
      {super.key, this.childAspectRatio = 1.5, this.crossAxisCount = 2});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: bottomCard.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
        mainAxisSpacing: 12.0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          ChartCard(bottomCardModel: bottomCard[index]),
    );
  }
}