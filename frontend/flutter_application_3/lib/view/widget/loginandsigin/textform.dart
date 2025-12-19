import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/constant/color.dart';

class MyTextfieled extends StatelessWidget {
  final TextEditingController textcontroller;
  final TextInputType keyboardType;
  final Widget prefixIcon;
  final String nameField;
  final String? Function(String?)? valid;
  final bool? obscurate;
  final void Function()? onPressedIcons;

  const MyTextfieled({
    super.key,
    required this.textcontroller,
    required this.keyboardType,
    required this.prefixIcon,
    required this.nameField,
    required this.valid,
    this.obscurate,
    this.onPressedIcons,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurate == null || obscurate == false ? false : true,
      controller: textcontroller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIconColor: ColorApp.pblack,
        suffixIcon: obscurate == true
            ? IconButton(
                onPressed: onPressedIcons,
                icon: Icon(Icons.visibility_off),
              )
            : obscurate == false
            ? IconButton(
                onPressed: onPressedIcons,
                icon: Icon(Icons.visibility),
              )
            : null,
        prefixIconColor: ColorApp.pblack,
        labelStyle: TextStyle(color: ColorApp.pblack),
        labelText: nameField,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ),
      validator: valid,
    );
  }
}
