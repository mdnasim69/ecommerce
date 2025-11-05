import 'package:ecommerce/App/AppUrls.dart';
import 'package:ecommerce/Features/Auth/UI/Controllers/Auth_controller.dart';
import 'package:ecommerce/Features/Auth/data/Models/SignInReqModel.dart';
import 'package:ecommerce/Features/Auth/data/Models/UserModel.dart';
import 'package:ecommerce/core/NetworkCaller/NetworkCaller.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  bool _Loading = false;

  bool get Loading => _Loading;
  String? errorMsg;
  bool IsSucess = false;

  Future<bool> signIn(String email, String password) async {
    _Loading = true;
    update();
    SignInReqModel signInReqModel = SignInReqModel(
      email: email,
      password: password,
    );
    NetworkResponse response = await Get.find<NetworkCaller>().PostReqest(
      url: AppUrls.SignInUrl,
      RequestBody: signInReqModel.toJson(),
    );

    if (response.IsSuccess) {
      String token = response.ResponseBody!['data']['token'];
      UserModel userModel = UserModel.fromJson(
        response.ResponseBody!['data']['user'],
      );
      Get.find<AuthController>().saveData(token, userModel);
      IsSucess = true;
      errorMsg = null;
    } else {
      IsSucess = false;
      errorMsg = response.erroeMessage;
    }
    _Loading = false;
    update();
    return IsSucess;
  }
}
