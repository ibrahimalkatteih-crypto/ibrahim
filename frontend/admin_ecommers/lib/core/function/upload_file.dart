import 'dart:io';

import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:admin_ecommers/core/service/myservices.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

MyServices myServices = Get.find();

imageUploadCamera() async {
  final ImagePicker picker = ImagePicker();

  final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

fileUploadGallery([isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: isSvg
        ? ["svg", "SVG"]
        : ["png", "PNG", "jpg", "JPG", "jpeg", "JPEG", "gif", "GIF"],
  );
  if (result != null) {
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottomMenu(imageUploadCamera, fileUploadGallery) {
  Get.bottomSheet(
    Directionality(
      textDirection: myServices.sharedPreferences.getString("lang") == "en"
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text(
                "52".tr,
                style: TextStyle(
                  fontSize: 22,
                  color: ColorApp.seconryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top:10)),
            ListTile(
              onTap: () {
                imageUploadCamera();
                Get.back();
              },
              leading: Icon(Icons.camera_alt,size: 40,),
              title: Text("58".tr,style: TextStyle(fontSize: 20),),
            ),
            ListTile(
              onTap: () {
                fileUploadGallery();
                Get.back();
              },
              leading: Icon(Icons.image,size: 40,),
              title: Text("59".tr,style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.white
  );
  
}
