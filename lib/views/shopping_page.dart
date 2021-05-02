import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_tut/controllers/card_controller.dart';
import 'package:get_x_tut/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cardController = Get.put(CardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controller.products[index].productName}',
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  '${controller.products[index].productDescription}',
                                  style: TextStyle(fontSize: 24),
                                ),
                                Text(
                                  '\$ ${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  elevation: 5.0,
                                  shadowColor: Colors.grey),
                              onPressed: () {
                                cardController
                                    .addToCard(controller.products[index]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Add to Cart',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            GetX<CardController>(builder: (cardController) {
              return Text(
                'Total amount: \$ ${cardController.totalPrice}',
                style: TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CardController>(builder: (cardController) {
          return Text(
            '${cardController.count}',
            style: TextStyle(color: Colors.black, fontSize: 24),
          );
        }),
        icon: Icon(
          Icons.add_shopping_cart,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
      ),
    );
  }
}
