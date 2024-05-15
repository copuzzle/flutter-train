import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("feed-新的界面, title: $title"),
        ),
        body: Center(
          child: Text("我是一个新的界面"),
        ),
      );
}
