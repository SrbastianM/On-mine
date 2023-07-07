import 'dart:async';

import 'package:flutter/material.dart';

class CountDownProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 75);
  // Iniciamos una variable booleana por defecto en falso
  bool isRunnig = false;
  // iniciamos una variable de tipo StreamSubscription la cual nos va a permitir, suscribir o desuscribir al streamProvider
  StreamSubscription<int>? _tickSubscription;
  // iniciamos una funcion que nos retorne, si esta o no esta corriendo y por notifique si hay o no un cambio
  void StartStopTimer() {
    // start Timer
    if (!isRunnig) {
      _startTimer(duration.inSeconds);
    } else {
      _tickSubscription?.pause();
    }

    isRunnig = !isRunnig;
    notifyListeners();
  }

  void _startTimer(int seconds) {
    _tickSubscription?.cancel();
    _tickSubscription = Stream<int>.periodic(
            const Duration(seconds: 1), (sec) => seconds - sec - 1)
        .take(seconds)
        .listen((timeLeftInSecods) {
      duration = Duration(seconds: timeLeftInSecods);
      notifyListeners();
    });
  }

  void setNewDuration(Duration newDuration) {
    duration = newDuration;
    _tickSubscription?.cancel();
    isRunnig = false;
    notifyListeners();
  }

  String get timeLeftString {
    // Estamos redondeando los segundos en minutos.
    final minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    final seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
