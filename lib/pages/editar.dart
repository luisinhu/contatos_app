import 'package:flutter/material.dart';
import 'package:contatos_app/classes.dart';

class EditContactPage extends StatefulWidget {
  final Contact contact;

  const EditContactPage({Key? key, required this.contact}) : super(key: key);

  @override
  State<EditContactPage> createState() => _EditContactPageState();
}

class _EditContactPageState extends State<EditContactPage> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _phoneController = TextEditingController(text: widget.contact.phone);
    _emailController = TextEditingController(text: widget.contact.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Contato',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF1F2937),
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
          child: SingleChildScrollView(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(labelText: 'Nome'),
                    ),
                    TextField(
                      controller: _phoneController,
                      decoration: const InputDecoration(labelText: 'Telefone'),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'E-mail'),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                        onTap: () {
                          _updateContact(context);
                        },
                        child: Container(
                          width: 260,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'Salvar Edição',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  void _updateContact(BuildContext context) async {
    // Obter os novos valores do contato
    String newName = _nameController.text;
    String newPhone = _phoneController.text;
    String newEmail = _emailController.text;

    // Atualizar o contato no banco de dados
    widget.contact.name = newName;
    widget.contact.phone = newPhone;
    widget.contact.email = newEmail;

    await DatabaseHelper().updateContact(widget.contact);

    // Retornar à tela anterior
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }
}
