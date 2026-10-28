import 'package:flutter/material.dart';

import 'cadastro_user.dart';
import 'consulta_user.dart';

class Principal extends StatelessWidget {
  const Principal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Controle de Cidades')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CadastroUser(),
                  ),
                );
              },
              child: const Text('Cadastro'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConsultaUser(),
                  ),
                );
              },
              child: const Text('Consultas'),
            ),
          ],
        ),
      ),
    );
  }
}