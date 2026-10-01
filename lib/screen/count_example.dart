import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/count_provider.dart';

class CountExample extends StatefulWidget {
  const CountExample({Key? key}) : super(key: key);

  @override
  _CountExampleState createState() => _CountExampleState();
}


class _CountExampleState extends State<CountExample> {
  void initState() {
    // TODO: implement initState
    super.initState();
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    Timer.periodic(Duration(seconds: 2), (timer) {
      countProvider.setCount();
    }); // Timer.periodic
  }
  @override
  Widget build(BuildContext context) {
    // CHANGE 1: listen: false
    // We only need this variable to CALL functions (like setCount).
    // listen: false means "don't rebuild the whole screen when the number changes".
    final countProvider = Provider.of<CountProvider>(context, listen: false);

    // This prints only ONCE now, because the whole screen no longer rebuilds.
    print('build');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Subscribe')),
      ),
      body: Center(
        // Consumer listens to the provider and rebuilds ONLY the widget inside it.
        child: Consumer<CountProvider>(builder: (context, value, child) {
          // This prints every time you tap the button (only this part rebuilds).
          print('Only this widget');

          // CHANGE 2: use value (not countProvider)
          // "value" is the provider given by Consumer, so this Text updates
          // whenever the number changes.
          return Text(
            value.count.toString(),
            style: TextStyle(fontSize: 50),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Button only calls the function, so we use countProvider here.
          // This increases the count and tells the Consumer to update.
          countProvider.setCount();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}