import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/iamgeasset.dart';
import 'package:flutter_application_3/core/myclass/statusrequest.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAsset.loding))
        : statusRequest == StatusRequest.offInternet
        ? Center(child: Lottie.asset(ImageAsset.ofInternet))
        : statusRequest == StatusRequest.serverFailure
        ? Center(child: Lottie.asset(ImageAsset.server))
        : statusRequest == StatusRequest.failure
        ? Center(child: Lottie.asset(ImageAsset.noData))
        : widget;
  }
}


class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(ImageAsset.loding))
        : statusRequest == StatusRequest.offInternet
        ? Center(child: Lottie.asset(ImageAsset.ofInternet))
        : statusRequest == StatusRequest.serverFailure
        ? Center(child: Lottie.asset(ImageAsset.server))
        :  widget;
  }
}