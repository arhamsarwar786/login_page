import 'package:flutter/material.dart';
import 'package:login_page/model/main_card_model.dart';
import 'package:login_page/utils/responsive.dart';
import 'package:login_page/views/widgets/custom_card.dart';


class CustomCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

const  CustomCardGridView(
      {super.key, this.childAspectRatio = 1, this.crossAxisCount = 4});

  @override
  Widget build(BuildContext context) {
    
   
    return GridView.builder(
      itemCount: myCards().length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
        mainAxisSpacing: 12.0,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          CustomCard(mainCardModel: myCards() [index]),
    );
  }
}