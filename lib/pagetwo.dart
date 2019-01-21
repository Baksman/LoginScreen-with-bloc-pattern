import "package:flutter/material.dart";

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: new Container(
          child: new Text("page twoo"),
        ),
      ),
    );
  }
}
