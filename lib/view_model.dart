// controllers/view_model.dart
import 'package:flutter/material.dart';
import '../game.dart';
import '../mark.dart';

class ViewModel extends ChangeNotifier {
  final Game _game = Game();

  int get score       => _game.score;
  int get rounds      => _game.rounds;
  int get targetValue => _game.targetValue;
  int get points      => _game.points;

  /// Nueva propiedad: lista de las 5 mejores
  List<Mark> get topMarks => _game.topMarks;

  void calculatePoints(double sliderValue) {
    _game.calculatePoints(sliderValue);
    notifyListeners();
  }

  void reset() {
    _game.reset();
    notifyListeners();
  }

  void restartGame() {
    _game.restartGame();
    notifyListeners();
  }
}
