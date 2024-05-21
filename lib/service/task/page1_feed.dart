import 'package:flutter/material.dart';
import 'package:app2/service/task/detail.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key, required this.title, this.onPush});
  final String title;
  final ValueChanged<int>? onPush;

  @override
  State<StatefulWidget> createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("${widget.title}:点一下加1：$_count"),
            MaterialButton(
                color: Colors.blue,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(title: widget.title))),
                child: Text("跳转"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: widget.title, onPressed: add, child: Icon(Icons.add)),
    );
  }

  void add() {
    setState(() {
      _count++;
    });
  }
}
