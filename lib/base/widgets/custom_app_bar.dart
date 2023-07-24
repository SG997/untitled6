
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends AppBar {
  String text;

  CustomAppBar(this.text) : super(
    leading: InkWell(
      onTap: ()=>{
        Get.back()
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: 24.0,
      ),
    ),
    title: Text(text),

  );
}