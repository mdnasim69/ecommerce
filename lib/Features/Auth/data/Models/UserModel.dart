class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String avatarUrl;
  final String city;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.avatarUrl,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonBody) {
    return UserModel(
      id: jsonBody['_id'],
      firstName: jsonBody['first_name']??' ',
      lastName: jsonBody['last_name']??' ',
      email: jsonBody['email'],
      phone: jsonBody['phone']??' ',
      avatarUrl: jsonBody['avatar_url']??' ',
      city: jsonBody['city']??' ',

    );
  }
 Map<String,dynamic> toJson(){
   return {
     '_id': id,
     'first_name': firstName,
     'last_name': lastName,
     'email': email,
     'phone': phone,
     'avatar_url': avatarUrl,
     'city': city
   };
  }
}
