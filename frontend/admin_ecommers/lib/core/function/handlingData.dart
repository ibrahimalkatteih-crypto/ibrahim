import 'package:admin_ecommers/core/class/statusRequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else
  {
    return StatusRequest.success;
  }
}