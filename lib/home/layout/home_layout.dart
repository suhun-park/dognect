import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  final List? iconItem;
   HomeLayout({this.iconItem,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: iconItem!.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),

        itemBuilder: (BuildContext context, int index){
          return Container(
              color: Colors.grey,
              margin: EdgeInsets.all(1),
          );
        });
  }
}
