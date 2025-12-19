import 'package:admin_ecommers/core/constant/colorApp.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class CusttomDropDownSerch extends StatefulWidget {
  final String title;
  final List<SelectedListItem<String>> listData;
  final TextEditingController name;
  final TextEditingController id;
  final Map ids;

  const CusttomDropDownSerch({
    super.key,
    required this.title,
    required this.listData,
    required this.name,
    required this.id,
    required this.ids,
  });

  @override
  State<CusttomDropDownSerch> createState() => _CusttomDropDownSerchState();
}

class _CusttomDropDownSerchState extends State<CusttomDropDownSerch> {
  showDropDownSerch() {
    DropDownState<String>(
      dropDown: DropDown<String>(
        bottomSheetTitle: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        submitButtonChild: Text("done"),
        data: widget.listData,
        onSelected: (selectedItems) {
          SelectedListItem selectedListItem = selectedItems[0];

          widget.name.text = selectedListItem.data;
          widget.id.text = widget.ids[selectedListItem.data].toString();
          print("${widget.name.text}==============================");
          print("${widget.id.text}==============================");
        },
      ),
    ).showModal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: 55,
      child: TextFormField(
        controller: widget.name,
        cursorColor: Colors.black,
        readOnly: true,
        onTap: () {
          FocusScope.of(context).unfocus();
          showDropDownSerch();
        },
      
        // decoration: InputDecoration(
        //   filled: true,
        //   fillColor: Colors.black12,
        //   contentPadding: const EdgeInsets.only(
        //     left: 8,
        //     bottom: 0,
        //     top: 0,
        //     right: 15,
        //   ),
        //   border: const OutlineInputBorder(
        //     borderSide: BorderSide(width: 0, style: BorderStyle.none),
        //     borderRadius: BorderRadius.all(Radius.circular(8.0)),
        //   ),
        // ),
        decoration: InputDecoration(
          hintText: widget.name.text == "" ? widget.title : widget.name.text,
      
          labelText: widget.name.text == "" ? widget.title : widget.name.text,
          prefixIconColor: ColorApp.pblack,
          suffixIconColor: ColorApp.pblack,
          prefixIcon: Icon(Icons.arrow_drop_down),
      
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}
