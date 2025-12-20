import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page/model/graph_model.dart';


class BottomCardModel {
  final IconData iconData;
  final String? title;
  final int? type;
  final List<GraphModel>? graphData;

  BottomCardModel(
      {required this.iconData,
        required this.title,
        required this.type,
        required this.graphData});
}

List bottomCard = [
  BottomCardModel(
      title: "Job Level and Gender",
      iconData: Icons.group,
      type: 0,
      graphData: graphCardData),
  BottomCardModel(
      title: "Country Insight",
      iconData: CupertinoIcons.cube,
      type: 1,
      graphData: countryData),
];