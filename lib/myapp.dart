import 'package:contatos_app/pages/first_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
    
}
}