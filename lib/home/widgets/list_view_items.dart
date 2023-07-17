import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ListViewItem extends StatefulWidget {
  const ListViewItem({Key? key}) : super(key: key);

  @override
  State<ListViewItem> createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 80.h,
      child: Expanded(child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(9, (index) => Container(
          margin: EdgeInsets.all(14),
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.black
          ),
        )),
      )),
    );
  }
}
