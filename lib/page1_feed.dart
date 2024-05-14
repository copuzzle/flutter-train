import 'package:flutter/material.dart';
import 'package:app2/page1_1_sub.dart';

class FeedPage extends StatefulWidget {
  final String _title;

  FeedPage(this._title);

  @override
  State<StatefulWidget> createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${widget._title}:点一下加1：$_count"),
            MaterialButton(
                color: Colors.blue,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage())),
                child: Text("跳转"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: widget._title, onPressed: add, child: Icon(Icons.add)),
    );
  }

  void add() {
    setState(() {
      _count++;
    });
  }
}
