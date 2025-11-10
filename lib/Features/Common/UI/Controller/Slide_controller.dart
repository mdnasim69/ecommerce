import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Common/data/SilderModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class SlideController extends GetxController {
  bool _Loading = false;
  bool get Loading => _Loading;
  String? errorMsg;
  bool IsSucess = false;
  List<SliderModel> sliders=[];
  Future<bool> getSlider() async {
    _Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().GetReqest(
      url: AppUrls.SlideUrl,
    );
    if (response.IsSuccess) {
      errorMsg = null;
      IsSucess = true;
      List<SliderModel> tempList =[];
      for(Map<String,dynamic> data in response.ResponseBody!['data']['results']){
        tempList.add(SliderModel.formJson(data));
      }
      sliders=tempList;
    } else {
      errorMsg = response.erroeMessage;
    }
    _Loading=false;
    update();
    return IsSucess;
  }
}
