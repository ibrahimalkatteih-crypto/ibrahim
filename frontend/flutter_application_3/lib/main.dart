import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/biding/biding.dart';
import 'package:flutter_application_3/core/localiztion/changelocal.dart';
import 'package:flutter_application_3/core/localiztion/translation.dart';
import 'package:flutter_application_3/core/services/services.dart';
import 'package:flutter_application_3/roots.dart';
import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

//android/app/google-services.json

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  await Firebase.initializeApp();
  

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    LocalControlar controllar = Get.put(LocalControlar());
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: controllar.lang,
      debugShowCheckedModeBanner: false,
      theme: controllar.appTheme,
      initialBinding: InitialBindings(),

      // home:
      // //Test(),

      // Languages(),
      // routes: routes,
      getPages: routes,
    );
  }
}
