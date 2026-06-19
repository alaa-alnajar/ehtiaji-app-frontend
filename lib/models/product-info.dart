 class Product {
  final int productId;
  final String productName;
  final String description;
  final double price;
  final double priceAfterDiscount ;
  final String image;
   int stockQuantity;
  final bool isAvailable;
  final int categoryId;
  final int mallId  ;
  

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.image,
    required this.priceAfterDiscount,
    required this.categoryId,
    required this.stockQuantity,
    required this.isAvailable,
    required this.mallId,
      });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['product_id'],
      productName: json['product_name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? 0 ,
      image: json['image'] ?? '',
      priceAfterDiscount: json['priceAfterDiscount'] ?? '',
      stockQuantity: json['stock_quantity'] ?? 0,
      isAvailable: json['is_available'] ?? false,
      categoryId:json['categoryId'] ?? '',
      mallId: json['mallId'] ?? '',

    );
  }
}



























/*class Product {
  final String name;
  final String price;
  final String image;
  final String description;
  final bool isSpecial;
  int quantity;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.isSpecial,
    this.quantity = 1,
  });

}*/