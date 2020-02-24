import 'package:flutter/material.dart';

class ContextRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Context测试"),
      ),
      body: Container(
        child: Builder(builder: (context) {
          Scaffold scaffold = context.findAncestorStateOfType();
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}