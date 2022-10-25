import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Login'),
      ),
      body: Center(
        child: Form(
          key: _key,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                ),
                TextFormField(
                  controller: _email,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'E-mail obrigatória';
                    } else {
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
                        child:
                            Icon(showPassword ? Icons.lock : Icons.lock_open),
                      )),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      print('certo');
                    }
                  },
                  child: const Text('Acessar'),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text('Cadastrar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
