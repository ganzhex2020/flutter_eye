import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/common/Constant.dart';
import 'package:flutter_eye/common/SizeConfig.dart';
import 'package:flutter_eye/ui/page/DiscoverPage.dart';
import 'package:flutter_eye/ui/page/FollowPage.dart';
import 'package:flutter_eye/ui/page/HomePage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  int _selectedIndex = 0;
  List<Widget> pageData = new List();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageData
      ..add(HomePage())
      ..add(DisCoverPage())
      ..add(HomePage())
      ..add(HomePage());
    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      // 设置EasyRefresh的默认样式
      EasyRefresh.defaultHeader = ClassicalHeader(
        enableInfiniteRefresh: false,
        refreshText: 'Pull to refresh',
        refreshReadyText: 'Release to refresh',
        refreshingText: 'Refreshing...',
        refreshedText: 'Refresh completed',
        refreshFailedText:'Refresh failed',
        noMoreText: 'No more',
        infoText: 'Update at %T',
      );
      EasyRefresh.defaultFooter = ClassicalFooter(
        enableInfiniteLoad: true,
        loadText: 'Pull to load',
        loadReadyText: 'Release to load',
        loadingText: 'Loading...',
        loadedText: 'Load completed',
        loadFailedText: 'Load failed',
        noMoreText: 'No more',
        infoText: 'Update at %T',
      );
    });

  }

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return new Scaffold(
     /* body: IndexedStack(
        index: _selectedIndex,
        children: pageData,
      ),*/
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pageData,
        physics: NeverScrollableScrollPhysics(), // 禁止滑动
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          _bottomItem(Constant.daily_paper, 'images/ic_home_normal.png',
              'images/ic_home_selected.png'),
          _bottomItem(Constant.discover, 'images/ic_discovery_normal.png',
              'images/ic_discovery_selected.png'),
          _bottomItem(Constant.hot, 'images/ic_hot_normal.png',
              'images/ic_hot_selected.png'),
          _bottomItem(Constant.mime, 'images/ic_mine_normal.png',
              'images/ic_mine_selected.png')
        ],
        currentIndex: _selectedIndex,
        onTap: onTap/*(index) {
          setState(() {
            _selectedIndex = index;
          });
        }*/,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  _bottomItem(String title, String normalIcon, String selectIcon) {
    return BottomNavigationBarItem(
        icon: Image.asset(normalIcon, width: 24, height: 24),
        activeIcon: Image.asset(selectIcon, width: 24, height: 24),
        label: title);
  }


}
