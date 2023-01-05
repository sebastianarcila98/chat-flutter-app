// ignore_for_file: prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.user});

  final User user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Widget _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(top: 8, bottom: 8, left: 80)
          : EdgeInsets.only(top: 8, bottom: 8),
      width: MediaQuery.of(context).size.width * .75,
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: isMe ? Color(0xffffef9eb) : Color(0xFFFFEFEE),
        borderRadius: !isMe
            ? BorderRadius.horizontal(
                right: Radius.circular(20),
              )
            : BorderRadius.horizontal(
                left: Radius.circular(20),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            message.text,
            style: TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );

    if (isMe) {
      return msg;
    }

    return Row(
      children: [
        msg,
        IconButton(
          onPressed: () {},
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          color: message.isLiked ? Theme.of(context).colorScheme.primary : null,
        ),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.image),
              color: Theme.of(context).colorScheme.primary),
          Expanded(
              child: TextField(
            textCapitalization: TextCapitalization.sentences,
            onChanged: (value) {},
            decoration: InputDecoration.collapsed(
              hintText: 'Send a message...',
            ),
          )),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send),
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              size: 30,
            ),
          ),
        ],
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: 500,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                  color: Colors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
