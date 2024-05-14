import 'package:flutter/material.dart';

class AbcdPageRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abcd Page, Hi."),
      ),
      body: Center(
        child: Text("This is abcd page."),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    // var args = ModalRoute.of(context).settings.arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("New route, echo."),
      ),
      body: Center(
        child: Text("This is new echo route"),
      ),
    );
  }
}
