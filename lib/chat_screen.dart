import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:glass_flutter/widgets/containers/glass_container.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.closeContainer});

  final VoidCallback closeContainer;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Container(
        color: Colors.black.withValues(alpha: 0.2),
        child: SafeArea(
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: closeContainer,
                    icon: Icon(Icons.close, color: Colors.grey),
                  ),
                  Expanded(
                    child: Text(
                      'Chat',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: GlassContainer(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.send, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
