import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_de_ti/login_screen.dart';
import 'package:projeto_de_ti/pagina_inicial.dart';
import 'package:projeto_de_ti/procurar_documento.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: FirebaseOptions(
      apiKey: "AIzaSyAp_wNbYjW6mjI_izk8TuV5MVSmx9cbmMY",
      appId: "1:1086424473740:web:0827e4abb766406f715ba9",
      messagingSenderId: "1086424473740",
      projectId: "projeto-de-ti")
);
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: const IntrinsicHeight(
                  child: LoginScreen(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
