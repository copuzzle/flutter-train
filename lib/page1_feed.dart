import 'package:flutter/material.dart';

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
        child: Text("${widget._title}:click add 1：$_count"),
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
