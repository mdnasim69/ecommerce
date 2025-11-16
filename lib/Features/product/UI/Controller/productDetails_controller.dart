import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/product/data/productModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool Loading = false;
  late ProductModel _productModel;
  ProductModel get productModel=>_productModel;
  String? errorMsg;
  bool IsSuccess = false;

  Future<bool> GetProductDeatails(String productID) async {
    Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().GetReqest(
      url: AppUrls.ProductsDetailsUrl(productID),
    );
    if(response.IsSuccess){
      errorMsg=null;
      IsSuccess=true;
      _productModel =ProductModel.fromJson(response.ResponseBody!['data']);
    }else{
      IsSuccess=false;
      errorMsg=response.erroeMessage;
    }
    Loading=false;
    update();
    return IsSuccess;
  }
}
