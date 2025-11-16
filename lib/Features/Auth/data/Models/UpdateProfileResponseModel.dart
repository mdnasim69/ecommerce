class UpdateProfileResponseModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String city;

  UpdateProfileResponseModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.city,
  });

  factory UpdateProfileResponseModel.fromJson(Map<String, dynamic> JsonData) {
    return UpdateProfileResponseModel(
      firstName: JsonData['first_name'],
      lastName: JsonData['last_name'],
      phone: JsonData['phone'],
      city: JsonData['city'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "phone": phone,
      "city": city,
    };
  }
}
