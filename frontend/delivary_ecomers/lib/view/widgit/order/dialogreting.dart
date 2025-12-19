import 'package:delivary_ecomers/contoller/orders/archiveCOntroller.dart';
import 'package:delivary_ecomers/core/constant/imageAssete.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

showDialogReing(BuildContext context, String orderId) {
  // show the dialog

  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(ImageAsset.logo, width: 100, height: 100),
      submitButtonText: 'Submit',
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        OrderArchivesController controller = Get.find();
        // print('rating: ${response.rating}, comment: ${response.comment}');
      },
    ),
  );
}
