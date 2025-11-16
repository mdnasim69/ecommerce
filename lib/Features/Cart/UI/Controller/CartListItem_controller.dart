import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Common/data/WishProductModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool Loading = false;
  bool IsSuccess = false;

  List<Wish_Cart_ProductModel> productList = [];
  String? errorMsg;
  Future<bool> getCartList() async {
    Loading=true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().GetReqest(
      url: AppUrls.CartListUrl,
    );
    if (response.IsSuccess) {
      IsSuccess = true;
      errorMsg = null;
      List<Wish_Cart_ProductModel> list = [];
      for (Map<String, dynamic> product
      in response.ResponseBody!['data']['results']) {
        list.add(Wish_Cart_ProductModel.formJson(product));
      }
      productList=list;
    } else {
      errorMsg = response.erroeMessage;
      IsSuccess = false;
    }
    Loading=false;
    update();
    return IsSuccess;
  }

  int totalPrice(){
    int total=0;
    for(Wish_Cart_ProductModel item in productList){
      total+=(item.productModel.currentPrice*item.quantity);
      print(total);
    }
    return total;
  }
  void UpdateItem(String ItemId,int quantity){
    for(Wish_Cart_ProductModel item in productList){
      if(ItemId==item.id){
        item.quantity=quantity;
        break;
      }
    }
    update();
}
}
