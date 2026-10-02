import 'package:flutter/material.dart';
import 'package:provide_tutorials/favorite/favorite_screen.dart';
import 'package:provide_tutorials/provider/count_provider.dart';
import 'package:provide_tutorials/provider/example_provider_one.dart';
import 'package:provide_tutorials/provider/favourite_provider.dart';
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

     return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) =>  ExampleProviderOne()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),

      ],
      child:
      MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FavoriteScreen(),
      )
     );
  }
}

