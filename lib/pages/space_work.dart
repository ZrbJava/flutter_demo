import 'package:flutter/material.dart';

class SpageWork extends StatefulWidget{
  @override
  _SpageWork createState() => _SpageWork();
}
  

  
class _SpageWork extends State<SpageWork>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text('工作台')),
      body: new Center(
        child: Text('工作台'),
      ),
    );
  }
  
}