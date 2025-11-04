import 'package:api_app/api_example/ApiExampleList.dart';
import 'package:api_app/api_example/AssignmentsWeek5.dart';
import 'package:api_app/page/animeted_test.dart';
import 'package:api_app/page/setting_page.dart';
import 'package:api_app/page/simple_custom_widget.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const AnimetedTest(),
    );
  }
}

 

