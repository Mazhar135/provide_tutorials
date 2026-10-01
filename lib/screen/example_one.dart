import 'package:flutter/material.dart';
import 'package:provide_tutorials/provider/example_provider_one.dart';
import 'package:provider/provider.dart';

class ExampleOne extends StatelessWidget {
  const ExampleOne({super.key});

  // ERROR 1 FIXED: deleted "get val => null;" because it is not needed.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribe'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SLIDER: reads the value from the provider and updates it
          Consumer<ExampleProviderOne>(builder: (context, provider, child) {
            return Slider(
              min: 0, // lowest value
              max: 1, // highest value
              value: provider.value, // current value from the provider
              onChanged: (value) {
                // ERROR 2 FIXED: use "value" (the slider's number)
                // and "setValue" with a small s, same as the provider method.
                provider.setValue(value);
              },
            );
          }),

          // ERROR 3 and 4 FIXED: two containers inside a Row, inside a Consumer
          // so they rebuild when the slider moves.
          Consumer<ExampleProviderOne>(builder: (context, provider, child) {
            return Row(
              children: [
                // Expanded makes each container take half of the screen width
                Expanded(
                  child: Container(
                    height: 100,
                    // withOpacity uses the slider value (0 to 1)
                    color: Colors.green.withOpacity(provider.value),
                    child: const Center(child: Text('Container 1')),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.red.withOpacity(provider.value),
                    child: const Center(child: Text('Container 2')),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}