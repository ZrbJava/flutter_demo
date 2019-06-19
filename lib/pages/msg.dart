import 'package:flutter/material.dart';

class Msg extends StatefulWidget{
  @override
  _Msg createState() => _Msg();
}
  

  
class _Msg extends State<Msg>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('消息')),
      body: new Center(
        child: Text('消息'),
      ),
    );
  }
  
}