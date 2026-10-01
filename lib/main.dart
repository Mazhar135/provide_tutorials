import 'package:flutter/material.dart';
import 'package:provide_tutorials/home_screen.dart';
import 'package:provide_tutorials/provider/count_provider.dart';
import 'package:provide_tutorials/screen/count_example.dart';
import 'package:provide_tutorials/stateful_widget_screen.dart';
import 'package:provide_tutorials/why_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

        create: (_) => CountProvider(),
      child:  MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: CountExample(),
    ),

    );

  }
}
