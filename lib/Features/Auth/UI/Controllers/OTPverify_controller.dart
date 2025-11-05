import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Auth/data/Models/VerifyOtpReqModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class OTPverifyController extends GetxController {
  bool _Loading = false;

  bool get Loading => _Loading;

  String? errorMsg ;

  Future<bool> VerifyOTP(VerifyOtpReqModel verifyOtp) async {
    bool IsSuccess = false;
    _Loading = true;
    update();
    NetworkResponse response = await Get.find<NetworkCaller>().PostReqest(
        url: AppUrls.VerifyOtpUrl, RequestBody: verifyOtp.toJson());
    if(response.IsSuccess){
      IsSuccess=true;
      errorMsg=null;
    }else{
      errorMsg=response.erroeMessage;
      IsSuccess=false;
    }
    _Loading = false;
    update();
    return IsSuccess;
  }
}