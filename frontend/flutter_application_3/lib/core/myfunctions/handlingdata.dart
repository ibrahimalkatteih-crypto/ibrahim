import 'package:flutter_application_3/core/myclass/statusrequest.dart';

handlingData(response){
  if(response is StatusRequest){
    return response;
  }else
  {
    return StatusRequest.success;
  }
}