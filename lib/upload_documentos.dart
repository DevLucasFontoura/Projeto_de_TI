import 'package:flutter/material.dart';
import 'package:projeto_de_ti/login_screen.dart';
import 'package:projeto_de_ti/entrar_em_contato.dart';
import 'package:projeto_de_ti/pagina_inicial.dart';

class UploadDocumentos extends StatelessWidget {
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
        title: const Text('Upload de Documentos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
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
                labelText: 'Título',
              ),
            ),
            const SizedBox(height: 16.0),
            const TextField(
              maxLines: 4, // Aumenta o número de linhas exibidas
              decoration: InputDecoration(
                labelText: 'Descrição do Documento',
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              width: double.infinity,
              height: 150.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: const Center(
                child: Text(
                  'Arraste e solte os arquivos aqui',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Enviar Arquivos'),
              onPressed: () {
                _enviarArquivos(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _enviarArquivos(BuildContext context) {
    // Lógica para enviar os arquivos
    // Você pode adicionar o código necessário para enviar os arquivos aqui
  }
}
