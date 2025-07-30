import 'package:flutter/material.dart';
import 'package:starwalk/views/Controll/controll_view.dart';

void main() => runApp(const GradientScrollApp());

class GradientScrollApp extends StatelessWidget {
  const GradientScrollApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scrollable Gradient Campsite',
      home: const Scaffold(body: ControllScreen(),),
    );
  }
}
