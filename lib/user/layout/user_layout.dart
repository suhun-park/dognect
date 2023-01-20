import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserLayout extends StatelessWidget {
  final String? userTitle;
  const UserLayout({this.userTitle,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dd"),
      ),
    );
  }
}
