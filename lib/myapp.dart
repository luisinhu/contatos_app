import 'package:contatos_app/pages/first_page.dart';
import 'package:flutter/material.dart';
import 'package:contatos_app/pages/terceira_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: First_Page(),
      debugShowCheckedModeBanner: false,
    );
    
}
}