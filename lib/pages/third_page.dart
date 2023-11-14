import 'package:flutter/material.dart';
import 'package:contatos_app/pages/first_page.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CADASTRAR CONTATO',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => First_Page()));
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
        ),
        backgroundColor: Color(0xFF1F2937),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F2937), Color(0xFF111827)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/contato.png",
              width: 150,
              height: 200,),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 400,
                height: 70,
                child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.name,
              style: TextStyle(color: Colors.white,fontSize: 20),
              decoration: InputDecoration(
                labelText: "Nome",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              )
                )
              ),
                 SizedBox(
                height: 40,
              ),
              
              SizedBox(
                width: 400,
                height: 70,
                child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white,fontSize: 20),
              decoration: InputDecoration(          
                  labelText: "Telefone",
                  labelStyle: TextStyle(color: Colors.white,fontSize: 20),
                  border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(10),
                  )
              )
                )
              ),
                 SizedBox(
                height: 40,
              ),
               SizedBox(
                width: 400,
                height: 70,
                child: TextFormField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white,fontSize: 20),
              decoration: InputDecoration(          
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Colors.white,fontSize: 20),
                  border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(10),
                  )
              )
                )
              ),
              ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

      },
      backgroundColor: Colors.white,
      child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
