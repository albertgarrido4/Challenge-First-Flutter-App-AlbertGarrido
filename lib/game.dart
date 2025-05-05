// models/game.dart
import 'dart:math';
import 'mark.dart';

class Game {
  static const int MIN_VALUE = 0;
  static const int MAX_VALUE = 100;

  int _targetValue;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;

  final List<Mark> _marks = [];

  Game() : _targetValue = Random().nextInt(MAX_VALUE + 1);

  int get score => _score;
  int get rounds => _rounds;
  int get targetValue => _targetValue;
  int get points => _points;

  /// Devuelve un listado de hasta 5 marcas, ordenadas de mayor a menor.
  List<Mark> get topMarks => List.unmodifiable(_marks);

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = MAX_VALUE - difference;
    _score += _points;
    _rounds++;

    // Añadimos la nueva marca con fecha/hora actual
    _marks.add(Mark(score: _points, dateTime: DateTime.now()));
    // Ordenamos de mayor a menor y nos quedamos con las 5 primeras
    _marks.sort((a, b) => b.score.compareTo(a.score));
    if (_marks.length > 5) {
      _marks.removeRange(5, _marks.length);
    }
  }

  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1);
    _points = 0;
  }

  void restartGame() {
    _targetValue = Random().nextInt(MAX_VALUE + 1);
    _points = 0;
    _score = 0;
    _rounds = 0;
    _marks.clear();
  }
}
