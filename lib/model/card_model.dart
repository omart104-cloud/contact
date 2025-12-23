class CardModel {
  final String name;
  final String phone;
  final String email;
  final String? imagePath;

  CardModel({
    required this.name,
    required this.phone,
    required this.email,
    this.imagePath,
  });
}
