import 'package:get/get.dart';

class TotalPriceController extends GetxController {
  RxInt totalPrice = 0.obs;

  addPrice(int price) {
    totalPrice.value += price;
  }

  resetPrice() {
    totalPrice.value = 0;
  }
}