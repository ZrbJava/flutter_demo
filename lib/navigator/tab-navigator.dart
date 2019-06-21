import 'package:flutter/material.dart';
import 'package:mysample/pages/home.dart';
import 'package:mysample/pages/msg.dart';
import 'package:mysample/pages/my.dart';
import 'package:mysample/pages/space_work.dart';


class TabNavigator extends StatefulWidget {
  @override
  _TabNavigator createState() => _TabNavigator();
}

class _TabNavigator extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.green;
  int _currentTab = 1;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[Home(), SpageWork(), Msg(), My()],
      ),
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          print('111');
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        currentIndex: _currentTab,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
           _currentTab = index; 
          });
        },
        items: [
          BottomNavigationBarItem (
            icon: Icon(Icons.home, color: _defaultColor),
            title: Text('首页',style: TextStyle( color: _currentTab != 0 ? _defaultColor : _activeColor)),
            activeIcon: Icon(Icons.home,color: _currentTab != 0 ? _defaultColor : _activeColor),
          ),

          BottomNavigationBarItem (
            icon: Icon(Icons.menu, color: _defaultColor),
            title: Text('工作台',style: TextStyle( color: _currentTab != 1 ? _defaultColor : _activeColor)),
            activeIcon: Icon(Icons.work,color: _currentTab != 1 ? _defaultColor : _activeColor),
          ),

          BottomNavigationBarItem (
            icon: Icon(Icons.message, color: _defaultColor),
            title: Text('消息',style: TextStyle(color: _currentTab != 2 ? _defaultColor : _activeColor)),
            activeIcon: Icon(Icons.message,color: _currentTab != 2 ? _defaultColor : _activeColor),
          ),

          BottomNavigationBarItem (
            icon: Icon(Icons.person, color: _defaultColor),
            title: Text('我的',style: TextStyle(color: _currentTab != 3 ? _defaultColor : _activeColor)),
            activeIcon: Icon(Icons.person,color: _currentTab != 3 ? _defaultColor : _activeColor),
          ),

        ],
        
      ),
    );
  }
}
