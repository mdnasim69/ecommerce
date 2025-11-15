import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool Loading = false;
  bool IsSuccess = false;
  String? errorMsg;
  Future<bool> AddToCart(String ProductId) async {
    Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().PostReqest(
      url: AppUrls.SignInUrl,
      RequestBody:{
        "product":ProductId
      },
    );
    if(response.IsSuccess){
      IsSuccess=true;
      errorMsg=null;

    }else{
      IsSuccess=false;
      errorMsg=response.erroeMessage;
    }
    Loading=false;
    update();
    return IsSuccess;
  }
}
