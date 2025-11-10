import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/product/data/productModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _initialLoading = true;

  bool get initialLoading => _initialLoading;
  bool _Loading = false;

  bool get Loading => _Loading;

  bool IsSuccess = true;

  String? errorMsg;

  int currentPage = 0;
  int count = 30;
  int? totalPage;

  List<ProductModel> _ProductList =[];
  List<ProductModel> get ProductList=>_ProductList;

  Future<bool> getProducts() async {
    if (totalPage != null && currentPage < totalPage!) {
      return true;
    }
    currentPage++;
    if(!_initialLoading){
      _Loading=true;
    }
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().GetReqest(
      url: AppUrls.ProductsUrl,
      params: {"page": currentPage, "count": count, "category": "680d1b45408c2a3e015a83de"},
    );
    if(response.IsSuccess){
      errorMsg=null;
      List<ProductModel> list =[];
      for(Map<String,dynamic> data in response.ResponseBody!['data']['results']){
        list.add(ProductModel.fromJson(data));
      }
      _ProductList.addAll(list);
      totalPage=response.ResponseBody!['data']['last_page'];
      IsSuccess=true;
    }else{
      IsSuccess=false;
      errorMsg=response.erroeMessage;

    }
    if(_initialLoading){
      _initialLoading=false;
    }else{
    _Loading=false;
    }
    update();
    return IsSuccess;
  }
}
