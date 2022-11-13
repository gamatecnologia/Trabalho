import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/views/profile/profile_provider.dart';

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
    final _action = context.watch<ProfileProvider>();
    _action.getDataUser();
    return Scaffold(
      drawer: const Drawer(child: DrawerNavigator()),
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('Nome: ${_action.myProfile.name ?? ""}'),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text('E-mail: ${_action.myProfile.email ?? ""}'),
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: ElevatedButton(
              onPressed: () {
                _action.signout(context);
              },
              child: const Text('Sair'),
            ),
          ),
        ],
      ),
    );
  }
}
