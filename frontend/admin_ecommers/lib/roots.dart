import 'package:admin_ecommers/core/constant/appRoots.dart';
import 'package:admin_ecommers/core/midllewere/midelwere.dart';
import 'package:admin_ecommers/view/screen/allUsers.dart';
import 'package:admin_ecommers/view/screen/auth/checkEmail.dart';
import 'package:admin_ecommers/view/screen/auth/login.dart';
import 'package:admin_ecommers/view/screen/auth/resetPassword.dart';
import 'package:admin_ecommers/view/screen/auth/succes.dart';
import 'package:admin_ecommers/view/screen/auth/virfycode.dart';
import 'package:admin_ecommers/view/screen/auth/virfycodelog.dart';
import 'package:admin_ecommers/view/screen/catigories/add.dart';
import 'package:admin_ecommers/view/screen/catigories/edit.dart';
import 'package:admin_ecommers/view/screen/catigories/view.dart';
import 'package:admin_ecommers/view/screen/home.dart';
import 'package:admin_ecommers/view/screen/items/add.dart';
import 'package:admin_ecommers/view/screen/items/edit.dart';
import 'package:admin_ecommers/view/screen/items/view.dart';
import 'package:admin_ecommers/view/screen/notifction.dart';
import 'package:admin_ecommers/view/screen/orders/homeScreen.dart';
import 'package:admin_ecommers/view/screen/languages.dart';
import 'package:admin_ecommers/view/screen/orders/archive.dart';
import 'package:admin_ecommers/view/screen/orders/ordersDetails.dart';
import 'package:admin_ecommers/view/screen/orders/pinding.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> roots = [
  GetPage(name: '/', page: () => Languages(), middlewares: [MyMiddleWere()]),
  GetPage(name: AppRoots.login, page: () => Login()),
  GetPage(name: AppRoots.orderScreen, page: () => OrderScreen()),
  GetPage(name: AppRoots.home, page: () => Home()),

  GetPage(name: AppRoots.virfycode, page: () => VirfyCode()),
  GetPage(name: AppRoots.checkEmial, page: () => CheckEmail()),
  GetPage(name: AppRoots.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoots.success, page: () => Success()),
  GetPage(name: AppRoots.virfycodeLog, page: () => VirfyCodeLog()),
  GetPage(name: AppRoots.orderPinding, page: () => OrdersPindings()),
  GetPage(name: AppRoots.orderDetails, page: () => OrdersDetails()),
  GetPage(name: AppRoots.archive, page: () => OrdersArchive()),
  GetPage(name: AppRoots.orderScreen, page: () => OrderScreen()),

  GetPage(name: AppRoots.viewCatigories, page: () => ViewCatigories()),
  GetPage(name: AppRoots.addCatigories, page: () => AddCatigories()),
  GetPage(name: AppRoots.editCatigories, page: () => EditCatigories()),

  GetPage(name: AppRoots.viewItems, page: () => ViewItems()),
  GetPage(name: AppRoots.addItems, page: () => AddItems()),
  GetPage(name: AppRoots.editItems, page: () => EditItems()),



  GetPage(name: AppRoots.allUsers, page: () => AllUsersScreen()),

    GetPage(name: AppRoots.notifction, page: () => Notifyction()),






];
