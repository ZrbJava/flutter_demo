import 'package:flutter/material.dart';

class My extends StatefulWidget{
  @override
  _My createState() => _My();
}
  

  
class _My extends State<My>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('我的')),
      body: new Center(
        child: Text('我的'),
      ),
    );
  }
  
}