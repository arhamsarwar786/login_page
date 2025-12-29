import 'package:easy_localization/easy_localization.dart';
import 'package:login_page/utils/app_images.dart';
import 'package:login_page/utils/app_text.dart';

class DetailCardModel {
  final String number;
  final String id;
  final String personImage;
  final String personName;
  final String email;
  final String countryName;
  final String status;
  final String jobTitle;

  DetailCardModel({
    required this.number,
    required this.id,
    required this.personImage,
    required this.personName,
    required this.email,
    required this.countryName,
    required this.status,
    required this.jobTitle,
  });
}

List<DetailCardModel> getDetailsList() {
  return [
    DetailCardModel(
      number: "510",
      id: "1",
      personImage: AppImages.person,
      personName: AppText.alanWalker.tr(),
      email: AppText.alanwalkergmail,
      countryName: AppText.french.tr(),
      status: AppText.fulltime.tr(),
      jobTitle: AppText.marketingManager.tr(),
    ),
    DetailCardModel(
      number: "620",
      id:"2",
      personImage:AppImages.person,
      personName: AppText.romanKalko.tr(),
      email: AppText.alanwalkergmail,
      countryName: AppText.usa.tr(),
      status: AppText.fulltime.tr(),
      jobTitle: AppText.uiuxDesigner.tr(),
    ),
    DetailCardModel(
      number: "1203",
      id: "3",
      personImage: AppImages.person,
      personName: AppText.chetanVaghela.tr(),
      email: AppText.chetanvgmail,
      countryName: AppText.india.tr(),
      status: AppText.fulltime.tr(),
      jobTitle: AppText.flutterDeveloper.tr(),
    ),
    DetailCardModel(
      number: "45",
      id: "4",
      personImage:AppImages.person,
      personName: AppText.foden.tr(),
      email: AppText.alanwalkergmail,
      countryName: AppText.japan.tr(),
      status: AppText.fulltime.tr(),
      jobTitle: AppText.productDesigner.tr(),
    ),
    DetailCardModel(
      number: "157",
      id:"5",
      personImage:AppImages.person,
      personName: AppText.alanWalker.tr(),
      email: AppText.chetanvgmail,
      countryName: AppText.indonesia.tr(),
      status: AppText.fulltime.tr(),
      jobTitle: AppText.marketingManager.tr(),
    ),
    DetailCardModel(
      number: "1203",
      id: "6",
      personImage:AppImages.person,
      personName: AppText.alanWalker.tr(),
      email: AppText.alanwalkergmail,
      countryName: AppText.uk.tr(),
      status: AppText.fulltime.tr(),
      jobTitle: AppText.marketingManager.tr(),
    ),
  ];
}