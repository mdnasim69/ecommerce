import 'package:ecommerce/Features/product/data/productModel.dart';

class Wish_Cart_ProductModel {
  final String id;
  final ProductModel productModel;
  final String user;
        int quantity;
  Wish_Cart_ProductModel({
    required this.id,
    required this.productModel,
    required this.user,
    required this.quantity,
  });

  factory Wish_Cart_ProductModel.formJson(Map<String, dynamic> JsonData) {
    return Wish_Cart_ProductModel(
      id: JsonData['_id'],
      productModel: ProductModel.fromJson(JsonData['product']),
      user: JsonData['user']??'',
      quantity:JsonData["quantity"]??1,
    );
  }
}

// {
// "_id": "6918ae0fcb4640bb4f193906",
// "product": {
// "_id": "6812577dea40bfc6edc673e3",
// "title": "জাভা প্রোগ্রামিং",
// "brand": "6799d84bceaaf5d3413a0989",
// "categories": [
// "680d1b45408c2a3e015a83de"
// ],
// "slug": "javaprogramming",
// "meta_description": null,
// "description": "তৃতীয় দশকে পদার্পণ করেছে জাভা। ১৯৯৫ সালে যাত্রা শুরু করে গত ২২ বছরে ক্রমাগত উন্নতি, প্রসার ও জনপ্রিয়তা অর্জন করেছে অত্যন্ত জনপ্রিয় এই প্রোগ্রামিং ভাষা। মিথষ্ক্রিয় ইন্টারনেট তৈরিতে নেতৃত্বদান ছাড়াও অন্য ইন্টারনেট প্রোগ্রামিংয়ের ভাষাগুলোকেও ক্রমাগত চ্যালেঞ্জের মুখে ফেলেছে জাভা। এতে ইন্টারনেট প্রোগ্রামিং ভাষাগুলোর মধ্যে প্রতিযোগিতার সৃষ্টি হয়েছে; ফলে জাভাসহ প্রতিটি ভাষার কম্পাইলারেই সন্নিবেশিত হয়েছে বিভিন্ন প্রযুক্তি, লাইব্রেরি, ফ্রেমওয়ার্ক ইত্যাদি। গত দু’দশক ধরে প্রকৌশল-বান্ধব প্রযুক্তি উন্নয়নেও নেতৃত্ব দিয়েছে জাভা, তাই আজও ওয়েব প্রোগ্রামিং বা ওয়েব অ্যাপ্লিকেশন তৈরিতে ডেভেলপারের প্রথম পছন্দের ভাষা জাভা।",
// "photos": [
// "https://wafilife-media.wafilife.com/uploads/2020/01/java-250x341.png"
// ],
// "colors": [],
// "sizes": [],
// "tags": [],
// "regular_price": null,
// "current_price": 706,
// "quantity": 1,
// "createdAt": "2025-04-30T17:01:49.861Z",
// "updatedAt": "2025-04-30T17:01:49.861Z",
// "__v": 0
// },
// "user": "690b6511e032c1ec9fa23323",
// "createdAt": "2025-11-15T16:45:03.550Z",
// "updatedAt": "2025-11-15T16:45:03.550Z",
// "__v": 0
// }
