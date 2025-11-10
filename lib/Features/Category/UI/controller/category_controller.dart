import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Category/data/categoryModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  bool _initialLoading = true;
  bool get initialLoading => _initialLoading;
  bool _Loading = false;
  bool get Loading => _Loading;
  String? errorMsg;
  bool IsSucess = false;
  int _currentPage = 0;
  int _countInPage = 30;
  int? _totalPage;
  int? get totalPage => _totalPage;
  List<CategoryModel> _categoryList = [];
  List<CategoryModel> get categoryList => _categoryList;

  Future<bool> getCategory() async {
    if(totalPage!=null&&_currentPage>_totalPage!){
      return true;
    }
    _currentPage++;
    if (!_initialLoading) {
      _Loading = true;
    }
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().GetReqest(
      url: AppUrls.CategoryUrl,
      params: {"count": _countInPage,"page": _currentPage},
    );
    if (response.IsSuccess) {
      errorMsg = null;
      List<CategoryModel> list = [];
      _totalPage = response.ResponseBody!['data']['last_page'];
      for (Map<String, dynamic> data
          in response.ResponseBody!['data']['results']){
        list.add(CategoryModel.fromJson(data));
      }
      _categoryList.addAll(list);
      IsSucess = true;
    } else {
      errorMsg = response.erroeMessage;
    }
    if (_initialLoading) {
      _initialLoading = false;
    } else {
      _Loading = false;
    }
    update();
    return IsSucess;
  }

  Future<bool> InitialGetCategory() async {
    _currentPage = 0;
    _initialLoading = true;
    _categoryList = [];
    return getCategory();
  }
}
