import 'package:flutter/material.dart';
import 'package:flutter_eye/ui/page/NewsListPage.dart';
import 'package:flutter_eye/ui/page/TopicsPage.dart';

import 'CategoryPage.dart';
import 'FollowPage.dart';


class DisCoverPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _DisCoverPageState();

}

class _DisCoverPageState extends State<DisCoverPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  TabController _tabController; //需要定义一个Controller
  PageController _pageController;
  List tabs = ['关注', '分类', '专题', '资讯', '推荐'];


  @override
  void initState() {
    super.initState();
    // 创建Controller
    _tabController = TabController(length: tabs.length,vsync:this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现',
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        brightness: Brightness.light,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 14),
                unselectedLabelStyle: TextStyle(fontSize: 14),
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: tabs.map((e) => Tab(text: e)).toList(),
                onTap: (index) => _pageController.animateToPage(index,
                    duration: kTabScrollDuration, curve: Curves.easeInCirc)),
          ),
          Expanded(child: PageView(
              controller: _pageController,
              onPageChanged: (index) => _tabController.index = index,
              children: <Widget>[
                FollowPage(),
                CategoryPage(),
                TopicsPage(),
                NewsListPage(),
                FollowPage()
              ]
          ))
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}

