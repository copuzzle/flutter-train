import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class LodingListView extends StatefulWidget {
  const LodingListView(this.onPush);
  @override
  LodingListViewState createState() => LodingListViewState();
  final ValueChanged<int>? onPush;
}

class LodingListViewState extends State<LodingListView> {
  final _scrollController = ScrollController();
  final _list = <String>[];
  int _currentPage = 1;
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    _fetchData(_currentPage);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _fetchData(int pageKey) async {
    setState(() {
      _isLoading = true;
      _error = null;
    });
    try {
      Future.delayed(Duration(milliseconds: 300)).then((e) {
        setState(() {
          //重新构建列表
          var words =
              generateWordPairs().take(20).map((e) => e.asPascalCase).toList();
          _list.addAll(words);
        });
      });
      _isLoading = false;
      // final response =
      //     await http.get('https://api.example.com/items?page=$pageKey');
      // if (response.statusCode == 200) {
      //   setState(() {
      //     _list.addAll(List<String>.from(json.decode(response.body)));
      //     _isLoading = false;
      //   });
      // } else {
      //   throw Exception('Failed to load data');
      // }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _error = e.toString();
      });
    }
  }

  void _loadMore() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !_isLoading) {
      _currentPage++;
      _fetchData(_currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _list.length + (_isLoading ? 1 : 0),
      itemBuilder: (BuildContext context, int index) {
        if (index == _list.length) {
          return Center(child: CircularProgressIndicator());
        } else {
          final name = _list[index];
          return Card(
              child: ListTile(
                  onTap: () => widget.onPush?.call(index),
                  title: Text(name, style: const TextStyle(fontSize: 20.0)),
                  subtitle: Text(name, style: const TextStyle(fontSize: 20.0)),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                  trailing: Icon(Icons.chevron_right)));
        }
      },
    );
  }
}
