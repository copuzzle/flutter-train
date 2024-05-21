import 'package:flutter/material.dart';
import 'package:app2/widget/limp.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage(
      {super.key, required this.title, this.materialIndex = 500});

  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LimpAppBar(
        title: Text(
          '$title - [$materialIndex]',
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          )),
    );
  }
}
