import 'package:flutter/material.dart';

class MessagingScreen extends StatefulWidget {
  @override
  _MessagingScreenState createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  final List<Message> _messages = [
    Message(sender: 'tutor', text: 'Hello! How can I help you today?'),
    Message(sender: 'student', text: 'Hi! I have a question about our upcoming session.'),
  ];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.add(Message(sender: 'student', text: text));
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with Tutor'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _buildMessage(_messages[index]),
              itemCount: _messages.length,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          message.sender == 'tutor'
              ? Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(child: Text('T')),
                )
              : Container(),
          Expanded(
            child: Column(
              crossAxisAlignment: message.sender == 'tutor'
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: <Widget>[
                Text(message.sender == 'tutor' ? 'Tutor' : 'You',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  margin: EdgeInsets.only(top: 5.0),
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: message.sender == 'tutor' ? Colors.green[100] : Colors.blue[100],
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Text(message.text),
                ),
              ],
            ),
          ),
          message.sender == 'student'
              ? Container(
                  margin: const EdgeInsets.only(left: 16.0),
                  child: CircleAvatar(child: Text('S')),
                )
              : Container(),
        ],
      ),
    );
  }
}

class Message {
  Message({required this.sender, required this.text});
  final String sender;
  final String text;
}