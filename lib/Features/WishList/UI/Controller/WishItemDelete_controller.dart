import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class WishItemDeleteController extends GetxController {
  bool Loading = false;
  bool IsSuccess = false;
  String? errorMsg;

  Future<bool> deleteItem(String wishItemId) async {
    Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().DeleteReqest(
      url: AppUrls.WishItemDeleteUrl(wishItemId),
    );
    if (response.IsSuccess) {
      errorMsg = null;
      IsSuccess = true;
    } else {
      errorMsg = response.erroeMessage;
      IsSuccess = false;
    }
    Loading = false;
    update();
    return IsSuccess;
  }
}
