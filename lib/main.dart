import 'package:flutter/material.dart';
import 'package:flutterdouban/pages/attention/main_attention_page.dart';
import 'package:flutterdouban/pages/mine/main_mine_page.dart';
import 'package:flutterdouban/widget/start_rating.dart';

import 'pages/home/main_home_page.dart';
import 'pages/message/main_message_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(title: '豆瓣'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: IndexedStack(
          index: _current_index,
          children: buildStackWidgets(),
        ),
        bottomNavigationBar: Theme(
            data: ThemeData(
                primarySwatch: Colors.green,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
              currentIndex: _current_index,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              type: BottomNavigationBarType.fixed,
              items: buildItems(),
              onTap: (index) {
                setState(() {
                  _current_index = index;
                });
              },
            )));
  }

  List<Widget> buildStackWidgets() {
    List<Widget> items = [];
    items.add(MainHomePage());
    items.add(MainAttentionPage());
    items.add(MainMessagePage());
    items.add(MainMinePage());
    return items;
  }

  List<BottomNavigationBarItem> buildItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(BottomNavigationBarItem(
        title: Text("首页"),
        icon: Image.asset(
          "assets/images/icon_home_tab_1_normal.png",
          width: 30,
          gaplessPlayback: true,
        ),
        activeIcon: Image.asset(
          "assets/images/icon_home_tab_1_selected.png",
          width: 30,
          gaplessPlayback: true,
        )));
    items.add(BottomNavigationBarItem(
        title: Text("关注"),
        icon: Image.asset(
          "assets/images/icon_home_tab_2_normal.png",
          width: 30,
          gaplessPlayback: true,
        ),
        activeIcon: Image.asset(
          "assets/images/icon_home_tab_2_selected.png",
          width: 30,
          gaplessPlayback: true,
        )));
    items.add(BottomNavigationBarItem(
        title: Text("消息"),
        icon: Image.asset(
          "assets/images/icon_home_tab_4_normal.png",
          width: 30,
          gaplessPlayback: true,
        ),
        activeIcon: Image.asset(
          "assets/images/icon_home_tab_4_selected.png",
          width: 30,
          gaplessPlayback: true,
        )));
    items.add(BottomNavigationBarItem(
        title: Text("我的"),
        icon: Image.asset(
          "assets/images/icon_home_tab_5_normal.png",
          width: 30,
          gaplessPlayback: true,
        ),
        activeIcon: Image.asset(
          "assets/images/icon_home_tab_5_selected.png",
          width: 30,
          gaplessPlayback: true,
        )));
    return items;
  }
}
