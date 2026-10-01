import 'package:flutter/material.dart';
import 'package:provide_tutorials/provider/example_provider_one.dart';
import 'package:provide_tutorials/screen/example_one.dart'; // check your path
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // The provider must be ABOVE MaterialApp so every screen can find it
    return ChangeNotifierProvider(
      create: (_) => ExampleProviderOne(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const ExampleOne(),
      ),
    );
  }
}