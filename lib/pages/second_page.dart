import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      height: 2340,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Color(0xFF1F2937), Color(0x00111827)], begin: Alignment.topLeft, end: Alignment.bottomRight
        
        )
      ),
    );
  }
}
