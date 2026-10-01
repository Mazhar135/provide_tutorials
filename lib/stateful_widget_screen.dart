import 'package:flutter/material.dart';

class StatefulWidgetScreen extends StatefulWidget {
  StatefulWidgetScreen({super.key});
  


  @override
  State<StatefulWidgetScreen> createState() => _StatefulWidgetScreenState();
}

class _StatefulWidgetScreenState extends State<StatefulWidgetScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Provider Tutorials',
        style: TextStyle(
          color: Colors.white
        ),
        )),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(DateTime.now().toString()),
          Container(
            child: Center(
              child: Text(count.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),),
            ),
          )
        ],

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            count++;
            print(count);
            setState(() {

            });

          },
          child: Icon(Icons.add),
          ),

    );
  }
}
