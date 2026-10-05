import 'package:flutter/material.dart';

class NotifyListnerScreen extends StatelessWidget {
  NotifyListnerScreen({super.key});

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  final ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Subscribe')),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<bool>(
            valueListenable: toggle,
            builder: (context, value, child) {
              return TextFormField(
                obscureText: value,
                decoration: InputDecoration(
                  hintText: 'password',
                  suffixIcon: InkWell(
                    onTap: () {
                      toggle.value = !toggle.value;
                    },
                    child: Icon(
                      value ? Icons.visibility_off_outlined : Icons.visibility,
                    ),
                  ),
                ),
              );
            },
          ),
          Center(
            child: ValueListenableBuilder<int>(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  value.toString(),
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}