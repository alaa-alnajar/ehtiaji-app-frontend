 class Offers {
  final String offerName;
  final String mallName;
  final String image;
  final String discountType;
  final String discountAmount;
  final String startDate;
  final String  endDate;
  final bool isActive;





  Offers({
    required this.offerName,
    required this.mallName,
    required this.image,
    required this.discountType,
    required this.discountAmount,
    required this.startDate,
    required this.endDate,
    required this.isActive

  });

  factory Offers.fromJson(Map<String, dynamic> json) {
    return Offers(
      offerName: json['offerName'] ?? '',
      mallName: json['mall_name'] ?? '',
      image: json['image'] ?? '',
      discountType: json['discountType'] ?? '',
      discountAmount: json['discountValue'].toString(),
      startDate: json['startDate'] ?? '',
      endDate: json['endDate'] ?? '',
      isActive: json['isActive'] ?? '',

    );
  }
}