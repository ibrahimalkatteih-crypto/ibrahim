import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/test_datacontrollar.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:get/get.dart';

class TestDataview extends StatelessWidget {
  const TestDataview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestDataControllar());
    return Scaffold(
      appBar: AppBar(title: Text("data")),
      body: GetBuilder<TestDataControllar>(
        builder: (controllar) {
          return HandlingDataView(
            statusRequest: controllar.statusRequest,
            widget: ListView.builder(
              itemCount: controllar.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: 
                       Text('${controllar.data[index]['users_name']}'),
                    subtitle:Text('${controllar.data[index]}') ,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
