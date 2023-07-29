import 'package:flutter/material.dart';
import 'package:projeto_de_ti/login_screen.dart';
import 'package:projeto_de_ti/entrar_em_contato.dart';
import 'package:projeto_de_ti/pagina_inicial.dart';

class RegistrarUsuarioPage extends StatefulWidget {
  @override
  _RegistrarUsuarioPageState createState() => _RegistrarUsuarioPageState();
}

class _RegistrarUsuarioPageState extends State<RegistrarUsuarioPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

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
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um e-mail';
                  }
                  // Aqui você pode adicionar uma validação mais detalhada para o e-mail
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma senha';
                  }
                  // Aqui você pode adicionar uma validação mais detalhada para a senha
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Executa ações de cadastro aqui, como enviar os dados para um servidor
                    _registerUser();
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registerUser() {
    // Aqui você pode implementar a lógica para realizar o cadastro do usuário
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    // Exemplo de exibição dos dados no console
    print('Nome: $name');
    print('E-mail: $email');
    print('Senha: $password');

    // Limpa os campos após o cadastro
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }
}

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: Text('Página Inicial'),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar em Contato'),
      ),
      body: Center(
        child: Text('Entre em contato conosco'),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Faça login'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserRegistrationPage(),
  ));
}
