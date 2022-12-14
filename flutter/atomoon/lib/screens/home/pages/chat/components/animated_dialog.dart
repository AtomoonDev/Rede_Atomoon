import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:image/comps/widgets.dart';
import 'package:atomoon/screens/home/pages/chat/components/widgets.dart';

import '../chat_messages.dart';

class AnimatedDialog extends StatefulWidget {
  final double height;
  final double width;

  const AnimatedDialog({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  State<AnimatedDialog> createState() => _AnimatedDialogState();
}

class _AnimatedDialogState extends State<AnimatedDialog> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    if (widget.height != 0) {
      Timer(const Duration(milliseconds: 200), () {
        setState(() {
          show = true;
        });
      });
    } else {
      setState(() {
        show = false;
      });
    }

    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.width == 0
                  ? const Color.fromARGB(255, 36, 58, 105).withOpacity(0)
                  : const Color.fromARGB(255, 36, 58, 105).withOpacity(0.4),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(widget.width == 0 ? 100 : 0),
                bottomRight: Radius.circular(widget.width == 0 ? 100 : 0),
                bottomLeft: Radius.circular(widget.width == 0 ? 100 : 0),
              )),
          child: widget.width == 0
              ? null
              : !show
                  ? null
                  : Column(
                      children: [
                        ChatWidgets.searchField(),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, i) {
                                return ChatWidgets.card(
                                  title: 'Contato Atomoon',
                                  time: '04:40',
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const ChatMessages(
                                            id: '',
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ],
    );
  }
}
