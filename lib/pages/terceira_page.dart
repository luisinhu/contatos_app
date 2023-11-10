import 'package:flutter/material.dart';
import 'package:contatos_app/pages/first_page.dart';

class tela3 extends StatefulWidget {
  const tela3({super.key});

  @override
  State<tela3> createState() => _tela3State();
}

class _tela3State extends State<tela3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Contatos",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => First_Page()));
            },
            icon: Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF1F2937), Color(0x00111827)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
        ),
        body: Container(
            width: 1080,
            height: 2340,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF1F2937), Color(0x00111827)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight))));
  }
}
