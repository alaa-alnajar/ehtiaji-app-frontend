class Mall {
  final int mallId;
  final String mallName;
  final double latitude ;
  final String longitude;
  final String phone;
  final String logo;
  

  Mall({
    required this.mallId,
    required this.mallName,
    required this.latitude,
    required this.longitude,
    required this.phone,
    required this.logo,
    
  });

  factory Mall.fromJson(Map<String, dynamic> json) {
    return Mall(
      mallId: json['mall_id'],
      mallName: json['mall_name'] ?? '',
      latitude: json['latitude'] ?? '',
      longitude: json['longitude'] ?? '',
      phone: json['phone'] ?? '',
      logo: json['logo'] ?? '',
     
    );
  }
}