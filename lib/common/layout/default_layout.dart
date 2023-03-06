import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color/color.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final String? title;
  final Widget? bottomNavigationBar;
  const DefaultLayout({required this.child,this.backgroundColor,this.title,this.bottomNavigationBar,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RenderAppbar(),
      backgroundColor: backgroundColor,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
  AppBar? RenderAppbar(){
    if(title == null){
      return null;
    }else{
      return AppBar(
        backgroundColor: BACKGROUND_COLOR,
        elevation: 0,
        title: Text(
          title!,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

    }

  }
}
