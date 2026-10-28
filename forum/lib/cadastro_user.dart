import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroUser extends StatefulWidget {
  const CadastroUser({super.key});

  @override
  State<CadastroUser> createState() => _CadastroUserState();
}

class _CadastroUserState extends State<CadastroUser> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Controllers para os campos de entrada
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _hierarquiaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _hierarquiaController.dispose();
    super.dispose();
  }

  Future<void> _registraruUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        await firestore.collection('users').add({
          'nome': _nomeController.text,
          'id': _idController.text,
          'email': _emailController.text,
          'hierarquia': _hierarquiaController.text,
        });
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Usuário registrado com sucesso!')),
        );
      } catch (e) {
        if (!mounted) return;

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Erro: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Usuário')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _nomeController,
                  decoration: const InputDecoration(labelText: 'Nome'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Insira um nome' : null,
                ),
                TextFormField(
                  controller: _idController,
                  decoration: const InputDecoration(labelText: 'ID'),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Insira um ID' : null,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _registraruUser,
                  child: const Text('Registrar usuário'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}