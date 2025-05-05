import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../view_model.dart';
import '../mark.dart';

class MarksView extends StatelessWidget {
  const MarksView({super.key});

  @override
  Widget build(BuildContext context) {
    final marks = context.watch<ViewModel>().topMarks;
    final formatter = DateFormat('dd/MM/yyyy – HH:mm');
    final primaryColor = Theme.of(context).primaryColor;
    // Calculamos el valor alfa (0–255) a partir de opacidad 0.1
    final avatarBg = primaryColor.withValues(alpha: (0.1 * 255).toDouble());

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏆 Leaderboard'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: marks.length,
        itemBuilder: (context, index) {
          final Mark m = marks[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: avatarBg,
              foregroundColor: primaryColor,
              child: Text('${index + 1}'),
            ),
            title: Text(
              '${m.score} puntos',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(formatter.format(m.dateTime)),
          );
        },
      ),
    );
  }
}
