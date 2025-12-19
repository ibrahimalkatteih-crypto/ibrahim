import 'package:get/get_utils/get_utils.dart';

validInput(String val, int min, int max,String type){
  if(type=="username"){
    if(!GetUtils.isUsername(val)){
        return '23'.tr;
    }
  }
  if(type=="email"){
    if(!GetUtils.isEmail(val)){
        return '24'.tr;
    }
  }
  if(type=="phone"){
    if(!GetUtils.isPhoneNumber(val)){
        return '25'.tr;
    }
  }
  
  if(val.isEmpty){
    return '26'.tr;
  }
  else if(val.length<min){
    return '${'27'.tr}$min';
  }else if(val.length>max){
    return '${'28'.tr}$max';
  }
  
  
}