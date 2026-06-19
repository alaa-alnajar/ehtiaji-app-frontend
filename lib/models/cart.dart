import 'package:ehtiaji/models/product-info.dart';
import 'package:ehtiaji/models/shoppinglistitem.dart';


class Cart {
  static DateTime? lastUpdate;

  static List<ShoppingListItem> items = [];

  static void addProduct(Product product) {

    int index = items.indexWhere(
      (item) => item.product.productName == product.productName,
    );

    if (index != -1) {

      items[index].quantity++;

    } else {

      items.add(
        ShoppingListItem(
         product: product,
         quantity: 1,
        ),
      );
         lastUpdate = DateTime.now();

      
    }
  }

  static void removeProduct(Product product) {

    int index = items.indexWhere(
      (item) => item.product.productName == product.productName,
    );

    if (index != -1) {

      if (items[index].quantity > 1) {

        items[index].quantity--;

      } else {

        items.removeAt(index);
        lastUpdate = DateTime.now();


      }
    }
  }

  static void deleteProduct(Product product) {

    items.removeWhere(
      (item) => item.product.productName == product.productName,
    );
  }

  static void clearCart() {

    items.clear();

  }
}






