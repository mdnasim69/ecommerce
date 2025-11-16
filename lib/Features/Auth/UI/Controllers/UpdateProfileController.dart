import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Auth/data/Models/SignUpReqModel.dart';
import 'package:ecommerce/Features/Auth/data/Models/UpdateProfileResponseModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController {
  bool _Loading = false;

  bool get Loading => _Loading;
  bool IsSuccess = false;
  String? errorMsg;

  Future<bool> updateProfile(UpdateProfileResponseModel updatePRM) async {
    _Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().PatchReqest(
      url: AppUrls.UpdateProfileUrl,
      RequestBody: updatePRM.toJson(),
    );
    if (response.IsSuccess) {
      errorMsg=null;
      IsSuccess = true;
    } else {
      IsSuccess = false;
      errorMsg=response.erroeMessage;
    }
    _Loading = false;
    update();
    return IsSuccess;
  }
}
