import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Common/data/WishProductModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool initialLoading = true;
  bool Loading = false;
  bool IsSuccess = false;
  int page = 0;
  int? totalPage;
  int? count = 30;
  List<Wish_Cart_ProductModel> productList = [];
  String? errorMsg;

  reSet() {
    initialLoading = true;
    Loading = false;
    IsSuccess = false;
    page = 0;
    totalPage;
    count = 30;
    productList = [];
    errorMsg;
  }

  Future<bool> wishList() async {
    if (totalPage != null && page > totalPage!) {
      return true;
    }

    page++;
    if (initialLoading) {
      initialLoading = true;
    } else {
      Loading = true;
    }
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().GetReqest(
      url: AppUrls.WishListUrl,
      params: {"page": page, "count": count},
    );
    if (response.IsSuccess) {
      IsSuccess = true;
      errorMsg = null;
      List<Wish_Cart_ProductModel> list = [];
      for (Map<String, dynamic> product
          in response.ResponseBody!['data']['results']) {
        list.add(Wish_Cart_ProductModel.formJson(product));
      }
      productList.addAll(list);
      totalPage = response.ResponseBody!['data']['last_page'] ?? 1;
    } else {
      errorMsg = response.erroeMessage;
      IsSuccess = false;
    }
    if (initialLoading) {
      initialLoading = false;
    } else {
      Loading = false;
    }
    update();
    return IsSuccess;
  }
}
