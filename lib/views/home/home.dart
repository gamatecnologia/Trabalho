import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho/models/profile_model.dart';
import 'package:trabalho/views/chat/details_screens.dart';
import 'package:trabalho/views/home/home_provider.dart';

import '../../shared/widgets/drawer_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final _action = context.watch<HomeProvider>();
    _action.getAllUsers();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const Drawer(child: DrawerNavigator()),
      appBar: AppBar(
        title: const Text('Conversas'),
        centerTitle: false,
      ),
      body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Center(
                          child: TextFormField(
                            onChanged: (text) {
                              setState(() {
                                List<ProfileModel> datas = _action
                                    .profilesCached
                                    .where((element) =>
                                        element.name!
                                            .toLowerCase()
                                            .contains(text.toLowerCase()) ||
                                        element.email!
                                            .toLowerCase()
                                            .contains(text.toLowerCase()))
                                    .toList();
                                _action.profiles = datas;
                              });
                            },
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText:
                                    'Pesquise por usuário, email ou mensagem...',
                                prefixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    SizedBox(
                      height: size.height * .7,
                      child: ListView.builder(
                          itemCount: _action.profiles.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              child: ListTile(
                                leading: const Icon(Icons.person),
                                title: Text(_action.profiles[index].name ?? ""),
                                subtitle:
                                    Text(_action.profiles[index].email ?? ""),
                                trailing: TextButton(
                                    child: const Text('Ver'),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (ctx) => DetailsScreen(
                                                    profileModel:
                                                        _action.profiles[index],
                                                  )));
                                    }),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ))),
    );
  }
}
