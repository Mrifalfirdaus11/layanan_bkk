import 'package:flutter/material.dart';

class Seting extends StatefulWidget {
  const Seting({super.key});

  @override
  State<Seting> createState() => _SetingState();
}

class _SetingState extends State<Seting> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: Text('Setting')),
      body: Center(
        child: Text('Seting Screen', style: TextStyle(fontSize: 40),),
      ),
    );
  }
}