import 'package:get/get.dart';

class BottomNavIndexController extends GetxController{
  int _index =0;
  int get index => _index;
  setIndex(int index){
    _index=index;
    update();
  }
}