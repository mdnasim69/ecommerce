import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class AddToWishListController extends GetxController {
  bool Loading = false;
  String? errorMsg;
  bool IsSuccess = false;

  Future<bool> addToWishList(String productId) async {
    Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().PostReqest(
        url: AppUrls.AddToWishUrl, RequestBody:{
      "product":productId
    });

    if(response.IsSuccess){
      IsSuccess=true;
      errorMsg=null;

    }else{
      errorMsg=response.erroeMessage;
      IsSuccess=false;
    }
    Loading=false;
    update();
    return IsSuccess;
  }
}

