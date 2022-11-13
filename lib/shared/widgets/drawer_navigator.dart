import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/views/login/login_provider.dart';

class DrawerNavigator extends StatelessWidget {
  const DrawerNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _action = context.watch<LoginProvider>();
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Row(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
                radius: 40,
              ),
              SizedBox(
                width: size.width * 0.04,
              ),
              Text(
                'Olá ' + _action.myProfile.name!,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ],
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
