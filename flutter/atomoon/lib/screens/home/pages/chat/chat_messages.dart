import 'package:flutter/material.dart';
//import 'package:image/comps/styles.dart';
//import 'package:image/comps/widgets.dart';

import 'package:atomoon/screens/home/pages/chat/components/styles.dart';
import 'package:atomoon/screens/home/pages/chat/components/widgets.dart';

class ChatMessages extends StatelessWidget {
  final String id;
  const ChatMessages({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 36, 58, 105).withOpacity(0.4),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 58, 105).withOpacity(0.4),
        title: const Text('Contato Atomoon'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Chats',
                  style: Styles.h1(),
                ),
                const Spacer(),
                Text(
                  'Visto por último: 05:10',
                  style: Styles.h1().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white70),
                ),
                const Spacer(),
                const SizedBox(
                  width: 50,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: Styles.friendsBox(),
              child: ListView.builder(
                itemCount: 5,
                reverse: true,
                itemBuilder: (context, i) {
                  return ChatWidgets.messagesCard(
                      i,
                      'Esse é um aplicativo feito para ajudar você: anônimo ou cliente.',
                      '05:05 am');
                },
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: ChatWidgets.messageField(onSubmit: (controller) {
              controller.clear();
            }),
          )
        ],
      ),
    );
  }
}
