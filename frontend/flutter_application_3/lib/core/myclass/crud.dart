import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:flutter_application_3/core/myfunctions/checkinternet.dart';
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
          return Left(StatusRequest.serverFailure);
        }
      } else {
        return Left(StatusRequest.offInternet);
      }
    }catch(_){
      return Left(StatusRequest.exsiption);
    }
  }
}
