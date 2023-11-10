import 'package:flutter/material.dart';
import 'package:contatos_app/pages/terceira_page.dart';

class First_Page extends StatefulWidget {
  const First_Page({super.key});

  @override
  State<First_Page> createState() => _First_PageState();
}

class _First_PageState extends State<First_Page> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1080,
      height: 2340,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1F2937), Color(0x00111827)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              _buildButton('Novo Contato', () {
                print('Novo Contato Pressionado');
              }),
              const SizedBox(
                height: 20,
              ),
              _buildButton('Contatos', () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => tela3()));
              }),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onPressed) {
    return Container(
      width: 260,
      height: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.white,
          side: BorderSide(color: Colors.white, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
