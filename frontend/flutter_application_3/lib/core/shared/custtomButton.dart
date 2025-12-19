import 'package:flutter/material.dart';

class CUsttomBottunShared extends StatelessWidget {
  final String nameButton;
  final void Function() onPressed;
  const CUsttomBottunShared({
    super.key,
    required this.onPressed,
    required this.nameButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10,right: 20,left: 20),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(vertical: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20),
        ),
        onPressed: onPressed,
        color: Colors.red,
        textColor: Colors.white,
        child: Text(nameButton,style: TextStyle(fontSize: 17),),
      ),
    );
  }
}
