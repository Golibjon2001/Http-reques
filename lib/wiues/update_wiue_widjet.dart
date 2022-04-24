import 'package:flutter/material.dart';

TextField textField(TextEditingController controller,String name){
  return TextField(
    controller:controller,
    decoration: InputDecoration(
      hintText:name,
    ),
  );
}
AppBar appBar(bool centerTitle,Text title){
  return AppBar(
    backgroundColor:Colors.grey.shade200,
    elevation:0,
    centerTitle:centerTitle,
    title:title,
  );
}