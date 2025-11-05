class SignInReqModel{
  final String email;
  final String password;

  SignInReqModel({required this.email, required this.password});

  toJson(){
    return {
      "email":email,
      "password":password
    };
  }
}