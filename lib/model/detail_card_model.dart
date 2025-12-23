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
    id: "1",
    personImage: "assets/images/person.png",
    personName: "Alan Walker",
    email: "alanwalker@gmail.com",
    countryName: "France",
    status: "Full time",
    jobTitle: "Marketing Manager",
  ),
  DetailCardModel(
    number: "620",
    id: "2",
    personImage: "assets/images/person.png",
    personName: "Roman Kalko",
    email: "alanwalker@gmail.com",
    countryName: "USA",
    status: "Full time",
    jobTitle: "UI/UX Designer",
  ),
  DetailCardModel(
    number: "1203",
    id: "3",
    personImage: "assets/images/person.png",
    personName: "Chetan Vaghela",
    email: "chetanv@gmail.com",
    countryName: "India",
    status: "Full time",
    jobTitle: "Flutter Developer",
  ),
  DetailCardModel(
    number: "45",
    id: "4",
    personImage: "assets/images/person.png",
    personName: "Foden",
    email: "alanwalker@gmail.com",
    countryName: "Japan",
    status: "Full time",
    jobTitle: "Product Designer",
  ),
  DetailCardModel(
    number: "157",
    id: "5",
    personImage: "assets/images/person.png",
    personName: "Alan Walker",
    email: "alanwalker@gmail.com",
    countryName: "Indonesia",
    status: "Full time",
    jobTitle: "Marketing Manager",
  ),
  DetailCardModel(
    number: "1203",
    id: "6",
    personImage: "assets/images/person.png",
    personName: "Alan Walker",
    email: "alanwalker@gmail.com",
    countryName: "UK",
    status: "Full time",
    jobTitle: "Marketing Manager",
  ),
];