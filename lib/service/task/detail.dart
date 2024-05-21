import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("feed-新的界面, title: $title"),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Show something! 我是一个新的界面'),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Go back!'),
                ),
              )
            ],
          ),
        ),
      );
}
