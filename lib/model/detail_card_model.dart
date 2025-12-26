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

List<DetailCardModel> detailsList = [
  DetailCardModel(
    number: "510",
    id: AppText.one, 
    personImage: "assets/images/person.png",
    personName: AppText.alanWalker,
    email: AppText.alanwalkerEmail,
    countryName: AppText.france,
    status: AppText.fulltime,
    jobTitle: AppText.marketingManager,
  ),
  DetailCardModel(
    number: "620",
    id: AppText.two, 
    personImage: "assets/images/person.png",
    personName: AppText.romanKalko,
    email: AppText.alanwalkerEmail,
    countryName: AppText.usa,
    status: AppText.fulltime,
    jobTitle: AppText.uiuxDesigner,
  ),
  DetailCardModel(
    number: "1203",
    id: AppText.three,
    personImage: "assets/images/person.png",
    personName: AppText.chetanVaghela,
    email: AppText.chetanVEmail,
    countryName: AppText.india,
    status: AppText.fulltime,
    jobTitle: AppText.flutterDeveloper,
  ),
  DetailCardModel(
    number: "45",
    id: AppText.four, 
    personImage: "assets/images/person.png",
    personName: AppText.foden,
    email: AppText.alanwalkerEmail,
    countryName: AppText.japan,
    status: AppText.fulltime,
    jobTitle: AppText.productDesigner,
  ),
  DetailCardModel(
    number: "157",
    id: AppText.five,
    personImage: "assets/images/person.png",
    personName: AppText.alanWalker,
    email: AppText.alanwalkerEmail,
    countryName: AppText.indonesia,
    status: AppText.fulltime,
    jobTitle: AppText.marketingManager,
  ),
  DetailCardModel(
    number: "1203",
    id: AppText.six,
    personImage: "assets/images/person.png",
    personName: AppText.alanWalker,
    email: AppText.alanwalkerEmail,
    countryName: AppText.uk,
    status: AppText.fulltime,
    jobTitle: AppText.marketingManager,
  ),
];