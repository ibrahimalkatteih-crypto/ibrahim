import 'package:flutter/material.dart';
import 'package:flutter_application_3/controlar/address/viewContoroller.dart';
import 'package:flutter_application_3/core/constant/rootsname.dart';
import 'package:flutter_application_3/core/myclass/handlingdataview.dart';
import 'package:flutter_application_3/data/model/addressModel.dart';
import 'package:get/get.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(title: Text("Address")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(AppRoots.addressAdd);
        },
        child: Icon(Icons.add),
      ),
      body: GetBuilder<ViewAddressController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            child: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return CardAddress(addressModel: controller.data[index],onPressed: () {
                  controller.deleteData(controller.data[index].addressId.toString());
                },);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class CardAddress extends StatelessWidget {
  final AddressModel addressModel;
  final void Function() onPressed;
  const CardAddress({
    super.key,
    required this.addressModel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),

        child: ListTile(
          title: Text(addressModel.addressName),
          subtitle: Text(
            "city : ${addressModel.addressCity} / street : ${addressModel.addressStreet}",
            style: TextStyle(fontSize: 17),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.delete_forever_outlined),
          ),
        ),
      ),
    );
  }
}
