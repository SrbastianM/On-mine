import 'package:flutter/material.dart';

class CountDownProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 70);
  // Iniciamos una variable booleana por defecto en falso
  bool isRunnig = false;
  // iniciamos una funcion que nos retorne, si esta o no esta corriendo y por notifique si hay o no un cambio
  void StartStopTimer() {
    // start Timer
    if (!isRunnig) {
    } else {
      // stop timer or unsuscribe
    }

    isRunnig = !isRunnig;
    notifyListeners();
  }
}
