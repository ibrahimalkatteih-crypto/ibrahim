import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/myfunctions/checkinternet.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  
  
  var res;
  initialddata()async{
     res =await checkInternet();
    print(res);

  }

  @override
  void initState() {
    super.initState();
    initialddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            
          ],
        ),
      ),
    );
  }
}
