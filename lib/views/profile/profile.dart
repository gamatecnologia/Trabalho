import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../shared/widgets/drawer_navigator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(child: DrawerNavigator()),
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Nome: Matheus'),
          ),
          const Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('E-mail: matheus@gmail.com'),
          ),
          const Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Idade: 23 anos'),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Sair'),
            ),
          ),
        ],
      ),
    );
  }
}
