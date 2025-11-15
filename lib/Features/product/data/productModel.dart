// {
// "_id": "67c7c21a623a876bc4767015",
// "title": "TUS Product 4",
// "brand":
// "categories": [
// {
// "_id": "6799c5d785b54cac3abec28f",
// "title": "New Category",
// "slug": "new-ca",
// "icon": "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png"
// },
// {
// "_id": "6799d7b8a164eec94185022f",
// "title": "Electronics",
// "slug": "electronics",
// "icon": "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png"
// },
// {
// "_id": "67c7bec4623a876bc4766fea",
// "title": "New Arrival",
// "slug": "new-arr",
// "icon": "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png"
// }
// ],
// "slug": "tus-product-4",
// "meta_description": null,
// "description": "cat description fgjh fgjh fj fj",
// "photos": [
// "https://opsg-img-cdn-gl.heytapimg.com/epb/202501/26/KL3ZNGfgHubc8642.jpg",
// "https://opsg-img-cdn-gl.heytapimg.com/epb/202501/02/zDc3USjyFOIYnO3M.jpg",
// "https://opsg-img-cdn-gl.heytapimg.com/epb/202412/19/P9iQuoBXP9MSFAG2.png",
// "https://opsg-img-cdn-gl.heytapimg.com/epb/202412/19/9xpwKzGQvvCpSZd6.png",
// "https://opsg-img-cdn-gl.heytapimg.com/epb/202412/19/8GSbdJcv5EIXej07.png",
// "https://opsg-img-cdn-gl.heytapimg.com/epb/202412/19/aHKkrDjJY0AWXDLm.png"
// ],
// "colors": [
// "Red",
// "Blue",
// "Green",
// "Purple",
// "Gold"
// ],
// "sizes": [
// "XS",
// "S",
// "L",
// "XL",
// "XXL"
// ],
// "tags": [],
// "regular_price": null,
// "current_price": 12000,
// "quantity": 1,
// "createdAt": "2025-03-05T03:16:42.420Z",
// "updatedAt": "2025-03-05T03:16:42.420Z"
// }

class ProductModel {
  final String id;
  final String title;
 // final BrandModel brandModel;
  final int? regularPrice;
  final String rating;
  final int currentPrice;
  final int availableQuantity;
  final List<String> photos;
  final List<String> sizes;
  final List<String> colors;
  final String description;

  ProductModel({
    required this.description,
    required this.id,
    required this.title,
  //  required this.brandModel,
    required this.regularPrice,
    required this.rating,
    required this.currentPrice,
    required this.availableQuantity,
    required this.photos,
    required this.sizes,
    required this.colors,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    List<dynamic> photos =jsonData['photos']??[];
    List<dynamic> sizes = jsonData['sizes']??[];
    List<dynamic> colors =jsonData['colors']??[];
    return ProductModel(
      description: jsonData['description']??'',
      id: jsonData['_id'],
      title: jsonData['title']??'',
   //   brandModel:BrandModel.fromJson(jsonData['brand']),
      regularPrice: jsonData['regular_price'],
      rating: jsonData['rating']??"4.0",
      currentPrice: jsonData['current_price'],
      availableQuantity: jsonData['quantity'],
      photos: List<String>.from(photos),
      sizes:List<String>.from(sizes),
      colors: List<String>.from(colors),
    );
  }
}

//{
// "_id": "67c7bf6e623a876bc4766ff1",
// "title": "TUS",
// "slug": "tus",
// "icon": "https://cdn.ostad.app/public/upload/2023-06-22T06-40-41.054Z-code-box-line.png"
// },

class BrandModel {
  final String id;
  final String title;
  final String slug;
  final String icon;

  BrandModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.icon,
  });

  factory BrandModel.fromJson(Map<String, dynamic> brandMap) {
    return BrandModel(
      id: brandMap['_id']??'',
      title: brandMap['title']??'',
      slug: brandMap['slug']??'',
      icon: brandMap['icon']??'',
    );
  }
}


