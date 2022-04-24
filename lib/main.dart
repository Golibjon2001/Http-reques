import 'package:flutter/material.dart';
import 'package:praktika/pages/create_page.dart';
import 'package:praktika/pages/hom_pages.dart';
import 'package:praktika/pages/update_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomPage(),
      routes:{
        "home":(context)=>const HomPage(),
        "create":(context)=>const CreatePage(),
        "update":(context)=>const UpdatePage(),
      },
    );
  }
}

