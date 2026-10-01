import 'package:flutter/material.dart';

class ExampleProviderOne with ChangeNotifier {

  double _value = 1.0;

  double get value => _value;

  // call this one when the slider move
  void setValue(val){
  _value = val;

  notifyListeners(); // tell the consumer rebuild
  }
}