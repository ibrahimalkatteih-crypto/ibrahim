import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_3/controlar/orders/pindingController.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';


requestPermissionNotifiction() async {
  await FirebaseMessaging.instance.requestPermission();

  
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("📩 إشعار وصلك: ${message.notification?.title}");
    print("📦 بيانات: ${message.data}");
    print("🔔 من التوبيك: ${message.from}");

    FlutterRingtonePlayer().playNotification();
    Get.snackbar(
      "📩 إشعار وصلك: ${message.notification?.title}",
      "📦 بيانات: ${message.data}",
    );
    refreshPageNotifiction(message.data);
  });
}


refreshPageNotifiction(Map data){
  print("========================================================");
  print(data['pageid']);
  print(data['pagename']);
  if(Get.currentRoute==AppRoots.orderPinding&&data['pagename']=="order"){
    OrderPindingsController controller=Get.find();
    controller.refreshOrder();    
}}