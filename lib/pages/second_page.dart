import 'package:contatos_app/pages/editar.dart';
import 'package:flutter/material.dart';
import 'package:contatos_app/classes.dart';
import 'editar.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final DatabaseHelper dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF1F2937),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1F2937), Color(0x00111827)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<List<Contact>>(
          future: dbHelper.getContacts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro ao carregar contatos: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text('Nenhum contato encontrado.'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  Contact contact = snapshot.data![index];
                  return buildContactTile(contact);
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget buildContactTile(Contact contact) {
    return ListTile(
      title: Text(contact.name, style: TextStyle(color: Colors.white)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(contact.phone, style: const TextStyle(color: Colors.white)),
          Text(contact.email, style: const TextStyle(color: Colors.white)),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {
              _navigateToEditContact(contact);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () async {
              await dbHelper.deleteContact(contact.id!);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  void _navigateToEditContact(Contact contact) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditContactPage(contact: contact),
      ),
    ).then((_) {
      // Atualizar a lista quando retornar da tela de edição
      setState(() {});
    });
  }
}
