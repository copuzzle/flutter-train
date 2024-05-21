import 'package:flutter/material.dart';
import 'package:app2/widget/loding_list_view.dart';
import 'package:app2/widget/limp.dart';

class ProjectPage extends StatefulWidget {
  ProjectPage({super.key, required this.title, this.onPush});
  final String title;
  final ValueChanged<int>? onPush;

  @override
  State<StatefulWidget> createState() => ProjectPageState();
}

class ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LimpAppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: LodingListView(widget.onPush),
      ),
    );
  }
}
