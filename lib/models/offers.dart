 class Offers {
  final String mallName;
  final String image;
  final String discountType;
  final String discountAmount;

  Offers({
    required this.mallName,
    required this.image,
    required this.discountType,
    required this.discountAmount,
  });

  factory Offers.fromJson(Map<String, dynamic> json) {
    return Offers(
      mallName: json['mall_name'] ?? '',
      image: json['image'] ?? '',
      discountType: json['discount_type'] ?? '',
      discountAmount: json['discount_value'].toString(),
    );
  }
}