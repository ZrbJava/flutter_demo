import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> with SingleTickerProviderStateMixin {
  static GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  final wordPair = new WordPair.random();
  final List menu = ['推荐有奖', '分享赚钱', '我的钱包', '购物车', '新闻资讯', '短信资讯'];
  static const menuColor = Colors.blue;
  final List menuIcon = [
    Icon(Icons.attach_money, color: menuColor),
    Icon(Icons.share, color: menuColor),
    Icon(Icons.money_off, color: menuColor),
    Icon(Icons.card_giftcard, color: menuColor),
    Icon(Icons.new_releases, color: menuColor),
    Icon(Icons.perm_phone_msg, color: menuColor),
  ];
  TabController _tabController; //需要定义一个Controller
  List tabs = ["新闻", "历史", "图片"];

  // 顶部tab
  @override
  void initState() {
    super.initState();
    // 创建Controller  
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // drawer: Drawer(
      //     child: new Container(
      //   padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0),
      //   child: new ListView.builder(
      //     itemCount: menu.length,
      //     itemBuilder: buildMenuItem,
      //   ),
      // ))
      key: _globalKey,
      drawer: _drawer,
      appBar: new AppBar(
        // 自定义左边菜单
        leading: Builder(
          builder: (context) {
            return IconButton(
                icon: Icon(Icons.dashboard),
                onPressed: () {
                  // 代码中打开抽屉菜单的方法在ScaffoldState中，通过Scaffold.of(context)可以获取父级最近的Scaffold Widget的State对象
                  //  Scaffold.of(context).openDrawer(); // 方法一：打开抽屉菜单
                  _globalKey.currentState
                      .openDrawer(); // 方法二：通过GlobalKey来获取State对象
                });
          },
        ),
        title: Text('首页'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              print('点击分享');
            },
          )
        ],
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()),
      ),
      // body: new ListView.builder(
      //   itemCount: 40,
      //   itemBuilder: buildItem,
      // )
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          //创建3个Tab页
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

// 抽屉
  get _drawer => Drawer(
        child: ListView(
          //1
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                //头像半径
                radius: 60,
                //头像图片 -> NetworkImage网络图片，AssetImage项目资源包图片, FileImage本地存储图片
                backgroundImage: NetworkImage(
                    'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg'),
              ),
              accountName: Text('jackie'),
              accountEmail: Text('zrbjava@gmail.com'),
            ),
            ListTile(
              leading: Icon(Icons.local_post_office),
              title: Text('邮件'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
            )
          ],
        ),
      );

// 菜单drawe widget
  // Widget buildMenuItem(BuildContext context, int index) {
  //   // if (index.isOdd) return new Divider();
  //   return new Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
  //     child: new Column(children: <Widget>[
  //       Row(
  //         children: <Widget>[menuIcon[index], Text(menu[index])],
  //       ),
  //       Divider(),
  //     ]),
  //   );
  // }

  Widget buildItem(BuildContext context, int index) {
    if (index.isOdd) return new Divider();
    //设置字体样式
    TextStyle textStyle =
        new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    //设置Padding
    return new Padding(
        padding: const EdgeInsets.all(8.0),
        // child: new Text(wordPair.asPascalCase, style: textStyle));
        child: new Text(wordPair.asPascalCase, style: textStyle));
  }
}
