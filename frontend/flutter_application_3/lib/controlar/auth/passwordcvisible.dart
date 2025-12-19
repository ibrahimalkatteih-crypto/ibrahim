import 'package:get/get.dart';

abstract class IsPasswordVisibleControllar extends GetxController{

  isPasswordVisible();
  isPssword(bool val);

}

class IsPasswordVisibleImp extends IsPasswordVisibleControllar{

  bool isPassVisible =false;
  bool isPasword=false;


  @override
  isPasswordVisible() {
   isPassVisible!=isPassVisible;
   update();
  }
  
  @override
  isPssword(bool val) {
    if(val){
      val =isPassVisible;
    }else {
      val =false;
    }
    update();
    return val;
  }
}