import 'package:delivary_ecomers/core/constant/appRoots.dart';
import 'package:delivary_ecomers/core/midllewere/midelwere.dart';
import 'package:delivary_ecomers/view/screen/auth/checkEmail.dart';
import 'package:delivary_ecomers/view/screen/auth/login.dart';
import 'package:delivary_ecomers/view/screen/auth/resetPassword.dart';
import 'package:delivary_ecomers/view/screen/auth/succes.dart';
import 'package:delivary_ecomers/view/screen/auth/virfycode.dart';
import 'package:delivary_ecomers/view/screen/auth/virfycodelog.dart';
import 'package:delivary_ecomers/view/screen/homeScreen.dart';
import 'package:delivary_ecomers/view/screen/languages.dart';
import 'package:delivary_ecomers/view/screen/orders/archive.dart';
import 'package:delivary_ecomers/view/screen/orders/ordersDetails.dart';
import 'package:delivary_ecomers/view/screen/orders/pinding.dart';
import 'package:delivary_ecomers/view/screen/orders/tracking.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> roots = [
  GetPage(name: '/', page: () => Languages(), middlewares: [MyMiddleWere()]),
  GetPage(name: AppRoots.login, page: () => Login()),
  GetPage(name: AppRoots.home, page: () => HomeScreen()),
  GetPage(name: AppRoots.virfycode, page: () => VirfyCode()),
  GetPage(name: AppRoots.checkEmial, page: () => CheckEmail()),
  GetPage(name: AppRoots.resetPassword, page: () => ResetPassword()),
    GetPage(name: AppRoots.success, page: () => Success()),
        GetPage(name: AppRoots.virfycodeLog, page: () => VirfyCodeLog()),
    GetPage(name: AppRoots.orderPinding, page: () => OrdersPindings()),
  GetPage(name: AppRoots.orderDetails, page: () => OrdersDetails()),
  GetPage(name: AppRoots.archive, page: () => OrdersArchive()),
    GetPage(name: AppRoots.tracking, page: () => Tracking()),




    

];
