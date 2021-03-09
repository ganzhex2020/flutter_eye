import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/viewmodel/NewsListViewModel.dart';

import 'NewsTitleWidgetItem.dart';

const TEXT_CARD_TYPE = "textCard";
const INFORMATION_CARD_TYPE = "informationCard";

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<NewsListViewModel>(
        viewModel: NewsListViewModel(),
        onModelInit: (model) {
          model.refresh();
        },
        builder: (context, model, index) {
          return LoadingContainer(
              loading: model.loading,
              error: model.error,
              retry: model.retry,
              child: EasyRefresh(
                controller: model.easyRefreshController,
                //     scrollController: viewModel.scrollController,
                onRefresh: () async {
                  model.refresh();
                },
                onLoad: () async {
                  model.loadMore();
                },
                child: ListView.builder(itemBuilder: (context, index) {
                  if (model.itemList[index].type == TEXT_CARD_TYPE) {
                    return NewsTitleWidgetItem(itemList: model.itemList[index]);
                  } else {
                    return NewsContentWidgetItem(
                        itemList: model.itemList[index]);
                  }
                },itemCount: model.itemList.length,),
              ));
        });
  }

  @override
  bool get wantKeepAlive => true;
}
