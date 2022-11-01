import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbara'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * .82,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, i) {
                      return redirectWhoIs(
                          'Marcela doidajsbfievrshuifwrhsioc wefopwrmfoprekoper oqwejfmporemopgeopkfope´pwsrofmoperfmoperfp pwfrmpovmero',
                          '15/10/2022',
                          i);
                    }),
              ),
              Container(
                height: size.height * .1,
                color: Colors.grey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 18),
                        width: size.width * .75,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 17, bottom: 5),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Digite sua mensagem'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Container(
                          width: size.width * .1,
                          child: CircleAvatar(
                            child: Icon(Icons.send),
                          ),
                        ),
                      ),
                    ]),
              )
            ]),
      ),
    );
  }

  Widget showMyMessage(String text, String date) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerRight,
      child: Card(
        color: Color.fromARGB(255, 105, 188, 108),
        child: Container(
          constraints: BoxConstraints(maxWidth: size.width * .75),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.white, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget redirectWhoIs(String text, String date, int teste) {
    switch (teste) {
      case 1:
        return showAnotherMessage(text, date);
      default:
        return showMyMessage(text, date);
    }
  }

  Widget showAnotherMessage(String text, String date) {
    Size size = MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.centerLeft,
      child: Card(
        color: Colors.grey[200],
        child: Container(
          constraints: BoxConstraints(maxWidth: size.width * .75),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  date,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // double calculeWidthContainerChat(String text) {
  //   Size size = MediaQuery.of(context).size;
  //   var maxWidth = size.width / 2;
  //   var valueWidthText = text.length +
  // }
}
