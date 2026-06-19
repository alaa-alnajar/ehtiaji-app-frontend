import 'package:ehtiaji/models/product-info.dart';

List<Product> allProducts = [

  Product(
    productId: 1,
    productName: "شكولاتة",
    description: "شكولاتة بالحليب 100 غرام",
    price: 2.00,
    priceAfterDiscount: 1.80,
    image: "assets/images/chocolate.png",
    stockQuantity: 10,
    isAvailable: true,
    categoryId: 8,
    mallId: 1,
  ),


  Product(
    productId: 2,
    productName: "زيت العافية",
    description: "زيت ذرة العافية",
    price: 2.30,
    priceAfterDiscount: 1.84,
    image: "assets/images/oil.png",
    stockQuantity: 10,
    isAvailable: true,
    categoryId: 5,
    mallId: 1,
  ),

  Product(
   productId:3,
   productName: "لبن ",
   description:": لبن بقري طازج 0.25 لتر",
   price: 0.30,
   priceAfterDiscount:0.24,
   image: "assets/images/yogurt.png",
   stockQuantity:10,
   isAvailable:true ,
   categoryId:2,
   mallId: 1),


   Product(productId:4,productName: "أرز مصري",description:"أرز مصري فاخر 5 كغم", price: 5.50,priceAfterDiscount:4.40, 
  image: "assets/images/rice.png", stockQuantity:10,isAvailable:true ,categoryId:5,mallId: 1),


 Product(productId:5,productName: " موز 1 كغ", description:"موز صومالي مستورد.",price: 2.30,priceAfterDiscount:1.84,
   image: "assets/images/banana.png", stockQuantity:10,isAvailable:true ,categoryId:1,mallId: 1),


  Product(productId:6,productName: "ليمون 1 كغ",description:"ليمون بلدي أردني", price: 3.00,priceAfterDiscount:2.40, 
  image: "assets/images/lemon.png",stockQuantity:10,isAvailable:true ,categoryId:1,mallId: 1),









];
