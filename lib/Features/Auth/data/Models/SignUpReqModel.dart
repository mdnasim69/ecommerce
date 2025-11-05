class SignUpReqModel {
  final String email;
  final String firstName;
  final String lastName;
  final String mobile;
  final String deliveryAddress;
  final String password;

  SignUpReqModel.formJson({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.deliveryAddress,
    required this.password,
  });

  toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobile,
      "city": deliveryAddress,
    };
  }
}
