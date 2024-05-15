import 'package:flutter/material.dart';
import 'package:app2/keep_alive_wrapper.dart';
import 'package:app2/loding_list_view.dart';

class TrendsPage extends StatefulWidget {
  TrendsPage(
      {super.key, required this.title, required this.color, this.onPush});
  final String title;
  final MaterialColor color;
  final ValueChanged<int>? onPush;

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
          child: LodingListView(widget.onPush),
        ),
      ),
    );
  }
}
