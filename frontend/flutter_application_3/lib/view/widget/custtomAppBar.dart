import 'package:flutter/material.dart';

class Custtomappbar extends StatelessWidget {
  final String titleAppBar;
  // final void Function() onPressedIcon;
  final void Function() onPressedIconFav;

  final void Function()? onPressedsearch;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const Custtomappbar({
    super.key,
    required this.titleAppBar,
    // required this.onPressedIcon,
    required this.onPressedsearch,
    required this.onPressedIconFav, 
    required this.onChanged, required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),

      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: myController,
              onChanged: onChanged,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedsearch,
                  icon: Icon(
                    Icons.search,
                    size: 37,
                    color: const Color.fromARGB(255, 55, 41, 41),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: Colors.grey[200],
                filled: true,
                hintText: titleAppBar,
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 55, 41, 41),
                ),
              ),
            ),
          ),
          // SizedBox(width: 6),
          // Container(
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(37),
          //     color: Colors.grey[200],
          //   ),
          //   child: IconButton(
          //     onPressed: onPressedIcon,
          //     icon: Icon(
          //       Icons.notifications_active_outlined,
          //       size: 37,
          //       color: const Color.fromARGB(255, 55, 41, 41),
          //     ),
          //   ),
          // ),
          SizedBox(width: 6),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(37),
              color: Colors.grey[200],
            ),
            child: IconButton(
              onPressed: onPressedIconFav,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 37,
                color: const Color.fromARGB(255, 55, 41, 41),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
