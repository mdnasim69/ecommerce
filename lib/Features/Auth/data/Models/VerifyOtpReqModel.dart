class VerifyOtpReqModel {
  final String email;
  final String Otp;

  VerifyOtpReqModel.formJsom({required this.email, required this.Otp});
  toJson(){
    return {
      "email":email,
      "otp":Otp // static
    };
  }
}
