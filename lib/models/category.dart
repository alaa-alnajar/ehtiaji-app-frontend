class Category {
  final int categoryId;
  final String categoryName;
  final String image;
  final int mallId;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.image,
    required this.mallId
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['category_id'],
      categoryName: json['category_name'] ?? '',
      image: json['image'] ?? '',
      mallId: json['mall'],

    );
  }
}