import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ContentView(),
      ),
    );
  }
}

class ContentView extends StatefulWidget {
  const ContentView({super.key});

  @override
  State<ContentView> createState() => _ContentViewState();
}

class _ContentViewState extends State<ContentView> {
  double _value = 50;
  final double _MIN_VALUE = 1.0;
  final double _MAX_VALUE = 100.0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("🎯🎯🎯🎯"),
          Text("68"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${_MIN_VALUE.toInt()}"),
                Expanded(child: Slider(value: _value, onChanged: _onChanged, min:_MIN_VALUE,max: _MAX_VALUE)),
                Text("${_MAX_VALUE.toInt()}"),
              ],
            ),
          ),
          Text("$_value"),
          ElevatedButton(onPressed: _onPressed, child: Text("TRY"))
        ],
      ),
    );
  }
  
  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
    
  }

  void _onPressed() {
    print("Button Pressed");
  }
}