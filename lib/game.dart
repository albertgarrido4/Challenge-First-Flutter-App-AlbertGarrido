import 'dart:math';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;

  int _targetValue = 0;
  int _points = 0;

  int get targetValue => _targetValue;
  int get points => _points;

  Game() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
  }

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (MAX_VALUE - difference);
  }

  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
  }
}
