import 'package:get/state_manager.dart';
import 'package:get_x_tut/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30.0,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40.0,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
      Product(
          id: 4,
          price: 60.0,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ForthProd'),
      Product(
          id: 5,
          price: 30.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FifthProd'),
    ];

    products.value = productResult;
  }
}
