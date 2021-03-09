import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/entity/topic_entity.dart';
import 'package:flutter_eye/ui/page/TopicDetailPage.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/viewmodel/TopicViewModel.dart';

class TopicsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TopicsPage();
}

class _TopicsPage extends State<TopicsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TopicViewModel>(
        viewModel: TopicViewModel(),
        onModelInit: (model) {
          model.refresh();
        },
        builder: (context, model, child) {
          return LoadingContainer(
              loading: model.loading,
              error: model.error,
              retry: model.retry,
              child: EasyRefresh(
                controller: model.easyRefreshController,
                scrollController: model.scrollController,
                onRefresh: () async {
                  model.refresh();
                },
                onLoad: () async {
                  model.loadMore();
                },
                child: ListView.separated(
                    itemBuilder: (context, index) {
                        return OpenContainer(
                            closedBuilder: (context,action){
                              return WidgetTopicItem(model.itemList[index].data);
                            },
                          openBuilder: (context,action){
                              return TopicDetailPage(detailId: model.itemList[index].data.id,);
                          },
                        );
                    //
                    },
                    separatorBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 5),
                        child: Divider(height: 0.5),
                      );
                    },
                    itemCount: model.itemList.length),
              ));
        });
  }

  WidgetTopicItem(Data data) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        child: CachedNetworkImage(
            width: double.infinity,
            height: 200,
            imageUrl: data.image,
            errorWidget: (context, url, error) =>
                Image.asset('images/img_load_fail.png'),
            fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
