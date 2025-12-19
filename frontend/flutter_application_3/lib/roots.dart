import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/midlewere/mymidelewere.dart';
import 'package:flutter_application_3/view/address/add.dart';
import 'package:flutter_application_3/view/address/addDetails.dart';
import 'package:flutter_application_3/view/address/view.dart';
import 'package:flutter_application_3/view/screen/auth/chekemail.dart';
import 'package:flutter_application_3/view/screen/auth/forgetPassword.dart';
import 'package:flutter_application_3/view/screen/auth/language.dart';
import 'package:flutter_application_3/view/screen/auth/login.dart';
import 'package:flutter_application_3/view/screen/auth/resetpassword.dart';
import 'package:flutter_application_3/view/screen/auth/signin.dart';
import 'package:flutter_application_3/view/screen/auth/successresetpassword.dart';
import 'package:flutter_application_3/view/screen/auth/successign_up.dart';
import 'package:flutter_application_3/view/screen/auth/virfiycode.dart';
import 'package:flutter_application_3/view/screen/auth/virfiycode_signUp.dart';
import 'package:flutter_application_3/view/screen/cart.dart';
import 'package:flutter_application_3/view/screen/checkOut.dart';
import 'package:flutter_application_3/view/screen/favorite.dart';
import 'package:flutter_application_3/view/screen/homeScreen.dart';
import 'package:flutter_application_3/view/screen/items.dart';
import 'package:flutter_application_3/view/screen/onboarding.dart';
import 'package:flutter_application_3/view/screen/orders/archive.dart';
import 'package:flutter_application_3/view/screen/orders/ordersDetails.dart';
import 'package:flutter_application_3/view/screen/orders/pinding.dart';
import 'package:flutter_application_3/view/screen/orders/tracking.dart';
import 'package:flutter_application_3/view/screen/prodactDetails.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => Languages(), middlewares: [MyMiddleWere()]),

  // GetPage(name: '/',page: ()=>Test()),
  // GetPage(name: '/', page: ()=>TestDataview()),
  GetPage(name: AppRoots.prodactDetails, page: () => ProdactDetails()),
  GetPage(name: AppRoots.login, page: () => Login()),
  GetPage(name: AppRoots.onboarding, page: () => Onboarding()),
  GetPage(name: AppRoots.sign_up, page: () => Sign_In()),
  GetPage(name: AppRoots.forgetpassword, page: () => ForgetPassword()),
  GetPage(name: AppRoots.verifiycode, page: () => VerFiyCode()),
  GetPage(name: AppRoots.resetpassword, page: () => ResetPassword()),
  GetPage(name: AppRoots.success, page: () => SuccessResitPassword()),
  GetPage(name: AppRoots.succesSignUp, page: () => SuccesSignUp()),
  GetPage(name: AppRoots.chekemail, page: () => ChekEmail()),
  GetPage(name: AppRoots.verifiycodeSignUp, page: () => VerFiyCodeSignUp()),
  GetPage(name: AppRoots.home, page: () => HomeScreen()),
  GetPage(name: AppRoots.items, page: () => Items()),
  GetPage(name: AppRoots.myFavorite, page: () => MyFavorite()),
  GetPage(name: AppRoots.cart, page: () => Cart()),
  GetPage(name: AppRoots.addressView, page: () => AddressView()),
  GetPage(name: AppRoots.addressAdd, page: () => AddressAdd()),
  GetPage(name: AppRoots.addressAddDetails, page: () => AddressAddPartTow()),
  GetPage(name: AppRoots.checkOut, page: () => CheckOut()),
  GetPage(name: AppRoots.orderPinding, page: () => OrdersPindings()),
  GetPage(name: AppRoots.orderDetails, page: () => OrdersDetails()),
  GetPage(name: AppRoots.archive, page: () => OrdersArchive()),
    GetPage(name: AppRoots.tracking, page: () => Tracking()),

];

// Map<String, Widget Function(BuildContext)> routess={
//   AppRoots.login:(context)=>Login(),
//   AppRoots.onboarding:(context)=>Onboarding(),
//   AppRoots.sign_up:(context)=>Sign_In(),
//   AppRoots.forgetpassword:(context)=>ForgetPassword(),
//   AppRoots.verifiycode:(context)=>VerFiyCode(),
//   AppRoots.resetpassword:(context)=>ResetPassword(),
//   AppRoots.success:(context)=>SuccessResitPassword(),
//   AppRoots.succesSignUp:(context)=>SuccesSignUp(),
//   AppRoots.chekemail:(context)=>ChekEmail(),
//   AppRoots.verifiycodeSignUp:(context)=>VerFiyCodeSignUp(),

// };
