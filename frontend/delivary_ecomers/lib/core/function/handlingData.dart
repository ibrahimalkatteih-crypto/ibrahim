import 'package:delivary_ecomers/core/class/statusRequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else
  {
    return StatusRequest.success;
  }
}