import 'package:flutter/material.dart';
import 'package:projeto_de_ti/pagina_inicial.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>(); // Chave global para o Scaffold

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.3,
                        child: TextFormField(
                          controller: _usernameController,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: 'User',
                            hintText: 'Enter user',
                            prefixIcon: Icon(Icons.people),
                            border: OutlineInputBorder(),
                            contentPadding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter a username' : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      FractionallySizedBox(
                        widthFactor: 0.3,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            hintText: 'Enter password',
                            prefixIcon: const Icon(Icons.password),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            border: const OutlineInputBorder(),
                            contentPadding:
                            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                          onChanged: (String value) {},
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter a password' : null;
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                      FractionallySizedBox(
                        widthFactor: 0.2,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String username = _usernameController.text;
                              String password = _passwordController.text;
                              if (username == 'Lucas' && password == '12345') {
                                _showSuccessMessage('Login realizado com sucesso!');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PaginaInicial(), // Utilize a página existente
                                  ),
                                );
                              } else {
                                // Incorrect username or password, show error
                                _showErrorMessage('Nome de Usuário ou Senha incorretos!');
                              }
                            }
                          },
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: const Text('Enter'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Método para exibir a mensagem de erro
  void _showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.redAccent, // Defina a cor de fundo desejada
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  // Método para exibir a mensagem de login feito com sucesso
  void _showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green, // Defina a cor de fundo desejada
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
