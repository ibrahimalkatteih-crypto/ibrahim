import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:delivary_ecomers/core/class/statusRequest.dart';
import 'package:delivary_ecomers/core/function/checkInternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String url, Map data) async {
    try{
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          print("00000000000000000000000000");
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offInternet);
      }
    }catch(_){
      print("==============================");
      return Left(StatusRequest.exsiption);
    }
  }
}
