class DetailCardModel {
  String number,
      personImage,
      personName,
      email,
      countryImage,
      countryName,
      status,
      jobTitle;

  DetailCardModel(
      {required this.number,
        required this.personImage,
        required this.personName,
        required this.email,
        required this.countryImage,
        required this.countryName,
        required this.status,
        required this.jobTitle});
}

List<DetailCardModel> detailsList = [
  DetailCardModel(
      number: "510",
      personImage: "assets/images/apple.png",
      personName: "Alan Walker",
      email: "alanwalker@gmail.com",
      countryImage: "assets/images/apple.png",
      countryName: "France",
      status: "Full time",
      jobTitle: "Marketing Manager"),
  DetailCardModel(
      number: "620",
      personImage: "assets/images/apple.png",
      personName: "Roman Kalko",
      email: "alanwalker@gmail.com",
      countryImage: "assets/images/apple.png",
      countryName: "USA",
      status: "Full time",
      jobTitle: "UI/UX Designer"),
  DetailCardModel(
      number: "1203",
      personImage: "assets/images/apple.png",
      personName: "Chetan Vaghela",
      email: "chetanv@gmail.com",
      countryImage: "assets/images/apple.png",
      countryName: "India",
      status: "Full time",
      jobTitle: "Flutter Developer"),
  DetailCardModel(
      number: "45",
      personImage: "assets/images/apple.png",
      personName: "Foden",
      email: "alanwalker@gmail.com",
      countryImage: "assets/images/apple.png",
      countryName: "Japan",
      status: "Full time",
      jobTitle: "Product Designer"),
  DetailCardModel(
      number: "157",
      personImage: "assets/images/apple.png",
      personName: "Alan Walker",
      email: "alanwalker@gmail.com",
    countryImage: "assets/images/apple.png",
      countryName: "Indonesia",
      status: "Full time",
      jobTitle: "Marketing Manager"),
  DetailCardModel(
      number: "1203",
      personImage: "assets/images/apple.png",
      personName: "Alan Walker",
      email: "alanwalker@gmail.com",
      countryImage: "assets/images/apple.png",
      countryName: "UK",
      status: "Full time",
      jobTitle: "Marketing Manager"),
];