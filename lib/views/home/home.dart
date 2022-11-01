import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/drawer_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return const Card(
                            elevation: 0,
                            child: ListTile(
                              title: Text('Ana'),
                              subtitle: Text('Bom dia'),
                              trailing: Text('13/10/2022'),
                            ),
                          );
                        }),
                  )
                ],
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) => SizedBox(
                    height: size.height * .6,
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            color: Colors.white,
                            child: const Card(
                              elevation: 0,
                              child: ListTile(
                                title: Text('Barbara'),
                                subtitle: Text('barbara@gmail.com'),
                              ),
                            ),
                          );
                        }),
                  ));
        },
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
