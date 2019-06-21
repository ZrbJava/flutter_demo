import 'package:flutter/material.dart';

class SpageWork extends StatefulWidget {
  @override
  _SpageWork createState() => _SpageWork();
}

class _SpageWork extends State<SpageWork> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: Text('工作台')),
        body: new GridView.extent(
          maxCrossAxisExtent: 120.0,
          childAspectRatio: 2.0,
          children: <Widget>[
            Icon(Icons.ac_unit),
            Icon(Icons.airport_shuttle),
            Icon(Icons.all_inclusive),
            Icon(Icons.beach_access),
            Icon(Icons.cake),
            Icon(Icons.free_breakfast),
        
          ],
        ));
  }
}
