import 'package:get/state_manager.dart';
import 'package:get_x_tut/models/product.dart';

class CardController extends GetxController {
  var cardItems = <Product>[].obs;
  int get count => cardItems.length;
  double get totalPrice => cardItems.fold(0, (sum, item) => sum + item.price!);

  var testAmount = 0.0;

  addToCard(Product product) {
    cardItems.add(product);
    testAmount = totalPrice;
    update();
  }
}
