import 'package:admin_ecommers/binding/bindind.dart';
import 'package:admin_ecommers/core/localization/changLocal.dart';
import 'package:admin_ecommers/core/localization/transletion.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:admin_ecommers/firebase_options.dart';
import 'package:admin_ecommers/roots.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,

    );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalControlar controlar = Get.put(LocalControlar());
    return GetMaterialApp(
      translations: MyTranslations(),
      locale: controlar.lang,
      debugShowCheckedModeBanner: false,
      theme: controlar.appTheme,
      getPages: roots,
      initialBinding: InitialBindings(),
    );
  }
}

