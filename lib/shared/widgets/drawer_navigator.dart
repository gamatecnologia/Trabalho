import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          child: Text(
            'Olá Matheus',
            style: TextStyle(color: Colors.white),
          ),
          decoration: BoxDecoration(color: Colors.green),
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, '/home'),
          leading: const Icon(Icons.people),
          title: const Text('Conversas'),
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, '/perfil'),
          leading: const Icon(Icons.person),
          title: const Text('Meu perfil'),
        )
      ],
    );
  }
}
