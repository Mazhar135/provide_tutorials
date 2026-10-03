import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
   NotifyListnerScreen({super.key});
// Stores a counter value (0) and updates the UI when it changes.
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);
  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar:AppBar(
        title: Center(child: const Text('Subscribe')),
      ),
      body: Column(

        children: [
          TextFormField(

            obscureText: toggle.value,

            decoration: InputDecoration(
              hintText: 'password'
            ),
          ),
          Center(child:ValueListenableBuilder(
              valueListenable: _counter,
              builder:(context, value , child){
                return Text(_counter.value.toString(), style: TextStyle(fontSize: 50),);
              })
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // What happens when you tap the button
         _counter.value++;
         print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
