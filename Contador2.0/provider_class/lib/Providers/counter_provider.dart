import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier{
  int _counter =0; //Variable privada, se usa en el provide unicamente
  String _primo = "Es primo";
  Color _colorPrimo = Colors.green;

  int get counter => _counter; //variable publica
  String get primo => _primo;
  Color get colorPrimo => _colorPrimo;

  void isPrime(){
    for(int i = 2; i < _counter; i++){
      if(_counter % i == 0){
        _primo = "NO Es Primo";
        _colorPrimo = Colors.blue;
        break;
      }else{
        _primo = "ES Primo";
        _colorPrimo = Colors.green;
      }
    }
    //notifyListeners();
  }
  void increment(){
    _counter++;
    notifyListeners(); //Avisa a los listeners que cambio un dato
  }
  void decrement(){
    _counter--;
    notifyListeners();
  }
  void reset(){
    _counter = 0;
    notifyListeners();
  }

  void multiDos(){
    _counter = _counter * 2;
    notifyListeners();
  }
  void multiTres(){
    _counter = _counter * 3;
    notifyListeners();
  }
  void multiCinco(){
    _counter = _counter * 5;
    notifyListeners();
  }

}