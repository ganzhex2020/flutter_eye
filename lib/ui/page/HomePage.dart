import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/common/Constant.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/ui/widget/rank_widget_item.dart';
import 'package:flutter_eye/utils/NavigatorUtil.dart';
import 'package:flutter_eye/viewmodel/HomeViewModel.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(Constant.daily_paper,
            style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ProviderWidget<HomeViewModel>(
          viewModel: HomeViewModel(),
          onModelInit: (viewmodel) {
            viewmodel.refresh();
          },
          builder: (context, viewModel, child) {
            return LoadingContainer(
              loading: viewModel.loading,
              error: viewModel.error,
              retry: viewModel.retry,
              child: EasyRefresh.custom(
                controller: viewModel.easyRefreshController,
                //     scrollController: viewModel.scrollController,
                onRefresh: () async {
                  viewModel.refresh();
                },
                onLoad: () async {
                  viewModel.loadMore();
                },
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        if (index == 0) {
                          return _banner(viewModel.bannerList);
                        } else {
                          if (viewModel.itemList[index].type == 'textHeader') {
                            return _titleItem(viewModel.itemList[index]);
                          } else {
                            return RankWidgetItem(
                                item: viewModel.itemList[index]);
                          }
                        }
                      },
                      childCount: viewModel.itemList.length,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  _banner(List<Item> bannerList) {
    return Container(
      width: double.infinity,
      height: 200.0,
      padding: EdgeInsets.only(left: 15, top: 15, right: 15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Swiper(
            autoplay: true,
            onTap: (index) {
              NavigatorUtil.toDetails(context, bannerList[index].data);
            },
            // scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                // alignment:Alignment.center,
                fit: StackFit.expand, //未定位widget占满Stack整个空间
                children: <Widget>[
                  Image.network(bannerList[index].data.cover.feed,
                      fit: BoxFit.fill),
                  Positioned(
                      width: MediaQuery.of(context).size.width - 30,
                      bottom: 0,
                      child: Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
                          decoration: BoxDecoration(color: Colors.black12),
                          child: Text(bannerList[index].data.title,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12))))
                ],
              );
            },
            itemCount: bannerList?.length ?? 0,
            pagination: new SwiperPagination(
                alignment: Alignment.bottomRight,
                builder: DotSwiperPaginationBuilder(
                    activeColor: Colors.white, color: Colors.white24))),
      ),
    );
  }

  _titleItem(Item item) {
    return Container(
        decoration: BoxDecoration(color: Colors.white24),
        padding: EdgeInsets.only(top: 15, bottom: 5),
        child: Center(
            child: Text(item.data.text,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold))));
  }

  @override
  bool get wantKeepAlive => true;
}
