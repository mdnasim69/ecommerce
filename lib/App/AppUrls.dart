import 'package:logger/logger.dart';

class AppUrls{
    static const String _baseUrl ='https://ecom-rs8e.onrender.com/api';

    static const SignUpUrl ='$_baseUrl/auth/signup';
    static const VerifyOtpUrl ='$_baseUrl/auth/verify-otp';
    static const SignInUrl ='$_baseUrl/auth/login';
    static const SlideUrl ='$_baseUrl/slides';
    static const CategoryUrl ='$_baseUrl/categories';
    static const ProductsUrl ='$_baseUrl/products';
    static ProductsDetailsUrl(String productID) => '$_baseUrl/products/id/$productID';
    static const AddToCartUrl ='$_baseUrl/cart';


}