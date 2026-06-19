import 'package:ehtiaji/models/product-info.dart';

class ShoppingListItem {
  final int quantity;
  final String totalPrice;
  final Product product;
  final DateTime lastUpdate;

  ShoppingListItem({
    required this.quantity,
    required this.totalPrice,
    required this.product,
    required this.lastUpdate
  });

  factory ShoppingListItem.fromJson(Map<String, dynamic> json) {
    return ShoppingListItem(
      quantity: json['quantity'],
      totalPrice: json['total_price'].toString(),
      product: Product.fromJson(json['product']),
      lastUpdate: json['lastUpdate'] 
    );
  }
}