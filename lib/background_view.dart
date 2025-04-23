import 'package:flutter/material.dart';
import 'package:flutter_guess_the_number/number_view.dart';
import 'package:flutter_guess_the_number/rounded_view.dart';
class BackgroundView extends StatelessWidget {
  const BackgroundView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              RoundedView(icon: Icons.refresh),
              Spacer(),
              RoundedView(icon: Icons.list)
            ],
          ),
          Spacer(),
          Row(
            children: [
              NumberView(text: "SCORE", value: 0),
              Spacer(),
              NumberView(text: "ROUND", value: 0),
            ],
          ),
        ],
      ),
    );
  }
}