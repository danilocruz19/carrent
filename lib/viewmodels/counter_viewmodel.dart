import 'package:flutter/cupertino.dart';
import 'package:nvvmproject/models/counter_model.dart';

class CounterViewmodel extends ChangeNotifier{
  CounterModel _counter = CounterModel(0);

  int get counter => _counter.value;

  void increment(){
    _counter.value++;
    notifyListeners();
  }
  void decrement(){
    if(_counter.value != 0){
      _counter.value--;
    }
    notifyListeners();
  }
}