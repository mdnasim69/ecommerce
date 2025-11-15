class SliderModel {
  final String id;
  final String photoUrl;
  final String description;
  final String? product;
  final String? category;
  final String? brand;

  SliderModel({
    required this.id,
    required this.photoUrl,
    required this.description,
    required this.product,
    required this.category,
    required this.brand,
  });

  factory SliderModel.formJson(Map<String, dynamic> jsonData) {
    return SliderModel(
      id: jsonData['_id'],
      photoUrl: jsonData['photo_url'] ?? '',
      description: jsonData['description'] ?? '',
      product: jsonData['product'] ?? '',
      category: jsonData['category'] ?? '',
      brand: jsonData['brand'] ?? '',
    );
  }

 Map<String,dynamic>  toJson(){
    return {
      "_id": id,
      "photo_url": photoUrl,
      "description": description,
      "product": product,
      "brand": brand,
      "category": category,
    };
  }
}
