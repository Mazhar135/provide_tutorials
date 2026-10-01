import 'dart:async';

import 'package:flutter/material.dart';

class WhyProvider extends StatefulWidget {
  const WhyProvider({super.key});

  @override
  State<WhyProvider> createState() => _WhyProviderState();


}

class _WhyProviderState extends State<WhyProvider> {
  int count = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), ((timer) {
      count++;
      print(count);
      setState(() {

      });

    }));
  }
  @override
  Widget build(BuildContext context) {
    print('build ' + count.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Subscribe',
          style: TextStyle(
              color: Colors.white
          ),
        )),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
         Text(DateTime.now().hour.toString() + ":"
             +DateTime.now().minute.toString()+ ":"
             +DateTime.now().second.toString(),
           style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 30
           ),), //this show hour, minute and second
          Container(
            child: Center(
              child: Text(count.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30
                ),
              ),
            ),
          )
        ],

      ),


    );
  }
}
