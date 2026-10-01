import 'package:flutter/material.dart';

// StatelessWidget = a screen that does not update itself
class HomeScreen extends StatelessWidget {

  // No "const" here, because we have a normal variable (int x) below.
  // If you write "const", you get the error
  // "Can't define a const constructor for a class with non-final fields".
  HomeScreen({super.key});

  // Normal variable. It is not final, so its value can change.
  int x = 10;

  @override
  Widget build(BuildContext context) {
    // This prints only when the screen is built.
    // You will see it only once, because the screen does not rebuild.
    print('build');

    return Scaffold(
      // Top bar of the screen
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text('Provider Tutorials')),
      ),

      // Main part of the screen
      body: Column(
        // Put the children in the middle (up and down)
        mainAxisAlignment: MainAxisAlignment.center,
        // Put the children in the middle (left and right)
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(
              // Show the value of x on the screen.
              // x.toString() changes the number to text.
              child: Text(
                x.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold, // thick text
                  fontSize: 25,                // text size
                ),
              ),
            ),
          ),
        ],
      ),

      // Round blue button at the bottom right
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          x++;        // add 1 to x (the value changes in memory)
          print(x);   // print the new value in the console
        },
        child: Icon(Icons.add), // plus icon inside the button
      ),
    );
  }
}