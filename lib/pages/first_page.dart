import 'package:flutter/material.dart';

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
              end: Alignment.bottomRight)),
      child: Stack(children: [
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
            )),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: 260, 
              height: 70, 
              decoration: BoxDecoration(
                color: Colors.transparent, 
                border:
                    Border.all(color: Colors.white, width: 1), 
                borderRadius:
                    BorderRadius.circular(8), 
              ),
              child: const Center(
                child: Text(
                  'Novo Contato',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 260, 
              height: 70, 
              decoration: BoxDecoration(
                color: Colors.transparent, 
                border:
                    Border.all(color: Colors.white, width: 1), 
                borderRadius:
                    BorderRadius.circular(8), 
              ),
              child: const Center(
                child: Text(
                  'Contatos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
