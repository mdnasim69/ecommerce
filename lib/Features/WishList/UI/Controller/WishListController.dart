import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/WishList/Data/WishProductModel.dart';
import 'package:ecommerce/Features/product/data/productModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool initialLoading = true;
  bool Loading = false;
  bool IsSuccess = false;
  int page = 0;
  int? totalPage;
  int? count = 30;
  List<WishProductModel> productList = [];
  String? errorMsg;

  Future<bool> wishList() async {

    if(totalPage!=null && page>totalPage!){
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
      List<WishProductModel> list = [];
      for (Map<String, dynamic> product
        in response.ResponseBody!['data']['results']) {
        list.add(WishProductModel.formJson(product));
      }
      productList.addAll(list);
      totalPage=response.ResponseBody!['data']['last_page']??1;
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
