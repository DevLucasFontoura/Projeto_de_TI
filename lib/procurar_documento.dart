import 'package:flutter/material.dart';
import 'package:projeto_de_ti/login_screen.dart';
import 'package:projeto_de_ti/entrar_em_contato.dart';
import 'package:projeto_de_ti/pagina_inicial.dart';


class ProcurarDocumentos extends StatelessWidget {
  const ProcurarDocumentos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.teal,
        title: const Text('Procurar Documento'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('Página Inicial'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaginaInicial()),
                );
              },
            ),
            ListTile(
              title: const Text('Entrar em Contato'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'ID do Documento',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Procurar Documento'),
              onPressed: () {
                // Lógica para procurar o documento
              },
            ),
          ],
        ),
      ),
    );
  }
}
