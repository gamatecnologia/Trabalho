import 'package:flutter/material.dart';
import 'package:trabalho/models/profile_model.dart';

class DetailsScreen extends StatefulWidget {
  ProfileModel? profileModel;
  DetailsScreen({super.key, this.profileModel});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    ProfileModel profileModel = widget.profileModel ?? ProfileModel();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Perfil de ${profileModel.name ?? ""}"),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 0,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                        radius: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome: ' + profileModel.name!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                          Text(
                            'E-mail ' + profileModel.email!,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
