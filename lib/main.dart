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
          Text("🎯🎯🎯🎯", style: Theme.of(context).textTheme.headlineMedium),
          Text("68", style: Theme.of(context).textTheme.headlineMedium?.copyWith(letterSpacing: -1, fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${_MIN_VALUE.toInt()}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                Expanded(child: Slider(value: _value, onChanged: _onChanged, min:_MIN_VALUE,max: _MAX_VALUE)),
                Text("${_MAX_VALUE.toInt()}", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text("$_value"),
          ElevatedButton(
            onPressed: _onPressed, 
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(48, 48),
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21))
            ),
            child: Text("TRY", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),),
          )
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