import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:projeto_de_ti/login_screen.dart';
import 'package:projeto_de_ti/pagina_inicial.dart';

void main() {
  runApp(const ContactPage());
}

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  void _launchURL(LinkableElement link) async {
    if (await canLaunch(link.url)) {
      await launch(link.url);
    } else {
      throw 'Could not launch ${link.url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Entre em Contato'),
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
                    MaterialPageRoute(builder: (context) => const PaginaInicial()),
                  );
                },
              ),
              ListTile(
                title: const Text('Entrar em Contato'),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactPage()),
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dev: Lucas Fontoura Righi Fontes',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _launchURL(LinkableElement(
                      'Celular: (61) 9 8328-8153',
                      'https://api.whatsapp.com/send?phone=5561983288153',
                      'Celular: (61) 9 8328-8153',
                    ));
                  },
                  child: Linkify(
                    options: const LinkifyOptions(
                      humanize: false,
                    ),
                    onOpen: _launchURL,
                    text: 'Celular: (61) 9 8328-8153',
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    _launchURL(LinkableElement(
                      'Instagram: @f0nt0ur4',
                      'https://www.instagram.com/f0nt0ur4/',
                      'Instagram: @f0nt0ur4',
                    ));
                  },
                  child: Linkify(
                    options: const LinkifyOptions(
                      humanize: false,
                    ),
                    onOpen: _launchURL,
                    text: 'Instagram: @f0nt0ur4',
                    style: const TextStyle(fontSize: 18, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
