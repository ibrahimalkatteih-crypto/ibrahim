import 'package:flutter_application_3/core/myclass/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(Crud());
  }
  
}