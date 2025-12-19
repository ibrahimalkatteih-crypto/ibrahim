import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:flutter/material.dart';

class CusttomTextFormGlobal extends StatelessWidget {
  final TextEditingController textController;
  final String name;
  final IconData prefixIcon;
  final bool? obscureText;
  final void Function()? onPressedIcon;
  final FormFieldValidator<String?> validator;

  const CusttomTextFormGlobal({
    super.key,
    required this.textController,
    required this.name,
    required this.prefixIcon,
    this.onPressedIcon,
    this.obscureText,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: 55,
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        controller: textController,
        validator: validator,
        decoration: InputDecoration(
          labelText: name,
          prefixIconColor: ColorApp.pblack,
          suffixIconColor: ColorApp.pblack,
          prefixIcon: Icon(prefixIcon),
          suffixIcon: obscureText == false
              ? IconButton(
                  onPressed: onPressedIcon,
                  icon: Icon(Icons.visibility),
                )
              : obscureText == true
              ? IconButton(
                  onPressed: onPressedIcon,
                  icon: Icon(Icons.visibility_off),
                )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
