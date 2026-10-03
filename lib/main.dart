import 'package:flutter/material.dart';
import 'package:provide_tutorials/favorite/favorite_screen.dart';
import 'package:provide_tutorials/provider/count_provider.dart';
import 'package:provide_tutorials/provider/example_provider_one.dart';
import 'package:provide_tutorials/provider/favourite_provider.dart';
import 'package:provide_tutorials/provider/theme_change_provider.dart';
import 'package:provide_tutorials/screen/dark_theme.dart';
import 'package:provide_tutorials/screen/example_one.dart'; // check your path
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleProviderOne()),
        ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChanger()),
      ],
      child: Builder(builder: (context) {
        // Rebuilds MaterialApp when themeMode changes
        final themeChanger = context.watch<ThemeChanger>();

        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,

          // Light theme
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          ),

          // Dark theme
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.red,
              brightness: Brightness.dark,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            iconTheme: IconThemeData(
              color: Colors.pink
            )
          ),

          home: const DarkThemeScreen(),
        );
      }),
    );
  }
}