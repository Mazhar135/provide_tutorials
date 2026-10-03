import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/theme_change_provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscribe',style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,

      ),

      body: Column(
        children: [
         RadioListTile(
           title: Text('Light Mode'),
             value: ThemeMode.light,
           groupValue: themeChanger.themeMode,
           onChanged: themeChanger.setTheme,


         ),
          RadioListTile(
            title: Text('Dark Mode'),
            value: ThemeMode.dark,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,


          ),
          RadioListTile(
            title: Text('System Mode'),
            value: ThemeMode.system,
            groupValue: themeChanger.themeMode,
            onChanged: themeChanger.setTheme,


          ),
          Icon(Icons.east)
        ],
      ),
    );
  }
}
