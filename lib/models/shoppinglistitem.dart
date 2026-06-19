import 'package:ehtiaji/models/product-info.dart';

class ShoppingListItem {
  Product product;
   int quantity;

  ShoppingListItem({
    required this.product,
     this.quantity = 1,
  }
     );
    
  }
