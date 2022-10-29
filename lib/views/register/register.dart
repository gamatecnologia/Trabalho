import 'package:flutter/material.dart';

import '../../shared/provider_messager/provider_messages.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool showPassword = true;
  bool showPassword2 = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Cadastro'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          child: Form(
            key: _key,
            child: Column(children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              TextFormField(
                controller: _name,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Nome é obrigatória';
                  } else {
                    return null;
                  }
                },
                decoration: const InputDecoration(hintText: 'Informe seu nome'),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              TextFormField(
                controller: _email,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'E-mail obrigatória';
                  } else {
                    if (!text.contains('.') ||
                        !text.contains('@') ||
                        text.contains(' ')) {
                      return 'E-mail inválido';
                    }
                    return null;
                  }
                },
                decoration:
                    const InputDecoration(hintText: 'Informe seu e-mail'),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              TextFormField(
                controller: _password,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Senha obrigatória';
                  } else {
                    return null;
                  }
                },
                obscureText: showPassword,
                decoration: InputDecoration(
                    hintText: 'Informe sua senha',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      child: Icon(showPassword ? Icons.lock : Icons.lock_open),
                    )),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              TextFormField(
                controller: _confirmPassword,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Campo obrigatório';
                  } else {
                    if (text != _password.text) {
                      return 'Confirmação inválida';
                    }
                    return null;
                  }
                },
                obscureText: showPassword2,
                decoration: InputDecoration(
                    hintText: 'Confirme sua senha',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          showPassword2 = !showPassword2;
                        });
                      },
                      child: Icon(showPassword2 ? Icons.lock : Icons.lock_open),
                    )),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_key.currentState!.validate()) {
                    ProviderMessager().showMessage('Cadastrado!', context);
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
