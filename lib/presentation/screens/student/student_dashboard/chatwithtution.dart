import 'package:flutter/material.dart';

class ChatwithTution extends StatefulWidget {
  final String tutionName;
  ChatwithTution(this.tutionName);

  @override
  _ChatwithTutionState createState() => _ChatwithTutionState();
}

class _ChatwithTutionState extends State<ChatwithTution> {
  TextEditingController _t1 = new TextEditingController();
  final List<Chatmessage> _l1 = <Chatmessage>[];

  void _handlesubmitted(String text) {
    _t1.clear();
    Chatmessage message = new Chatmessage(text: text);
    setState(() {
      _l1.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return new IconTheme(
      data: new IconThemeData(
        color: Color(0xff403b58),
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                    new InputDecoration.collapsed(hintText: "Enter message"),
                controller: _t1,
                onSubmitted: _handlesubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                  icon: new Icon(Icons.send),
                  onPressed: () => _handlesubmitted(_t1.text)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Chat with ${widget.tutionName}",
              style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xff403b58),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: <Widget>[
            new Flexible(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _l1[index],
                itemCount: _l1.length,
              ),
            ),
            new Divider(
              height: 1.0,
            ),
            new Container(
              decoration: new BoxDecoration(
                color: Colors.white,
              ),
              child: _textComposerWidget(),
            ),
          ],
        ));
  }
}

const String _name = "You";

class Chatmessage extends StatelessWidget {
  final String text;
  Chatmessage({this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: new Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(right: 8.0),
            child: new CircleAvatar(
              child: new Text(_name[0]),
              backgroundColor: Color(0xff403b58),
            ),
          ),
          new Column(
            children: <Widget>[
              // new Container(
              //   child: new Text(
              //     _name,
              //     style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //     ),
              //     // style: Theme.of(context).textTheme.subhead,
              //     textAlign: TextAlign.right,
              //   ),
              // ),
              new Container(
                margin: const EdgeInsets.only(top: 0.0),
                child: new Text(
                  text,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
