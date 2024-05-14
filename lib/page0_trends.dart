import 'package:flutter/material.dart';
import 'package:app2/keepAliveWrapper.dart';
import 'package:app2/lodingListView.dart';

class TrendsPage extends StatefulWidget {
  final String title;

  TrendsPage(this.title);

  @override
  State<StatefulWidget> createState() => TrendsPageState();
}

class TrendsPageState extends State<TrendsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: KeepAliveWrapper(
        keepAlive: true,
        child: Container(
          color: Colors.red,
          child: LodingListView(),
        ),
      ),
    );
  }
}
