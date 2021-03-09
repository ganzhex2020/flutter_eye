

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/entity/topic_detail_entity.dart';
import 'package:flutter_eye/ui/page/TopicDetailWidgetItem.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/ui/widget/rank_widget_item.dart';
import 'package:flutter_eye/viewmodel/TopicDetailViewModel.dart';

class TopicDetailPage extends StatefulWidget{

  final int detailId;
  const TopicDetailPage({Key key, this.detailId}) : super(key: key);

  @override
  _TopicDetailState createState()  => _TopicDetailState();
}

class _TopicDetailState extends State<TopicDetailPage>{


  @override
  Widget build(BuildContext context) {
      return ProviderWidget<TopicDetailViewModel>(
          viewModel: TopicDetailViewModel(widget.detailId),
          onModelInit: (model) {
            model.getTopicDetailData();
          },
          builder: (context, model, child){
            return LoadingContainer(
              loading: model.loading,
              error: model.error,
              retry: model.retry,
              child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    model.topicDetailEntity.brief != null?model.topicDetailEntity.brief:"",
                    style: TextStyle(
                        fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  brightness: Brightness.light,
                  //白底黑字
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context)),
                ),
                body: CustomScrollView(
                  slivers: <Widget>[
                    _headWidget(model.topicDetailEntity),
                    SliverList(
                        delegate:
                        SliverChildBuilderDelegate((context, index) {
                          return TopicDetailWidgetItem(model.itemList[index]);
                        }, childCount: model.itemList.length))
                  ],

                ),
              )
            );
          }
      );

  }

  _headWidget(TopicDetailEntity topicDetailEntity) {
    return SliverToBoxAdapter(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  imageUrl: topicDetailEntity.headerImage??"",
                  errorWidget: (context, url, error) =>
                      Image.asset('images/img_load_fail.png'),
                  fit: BoxFit.cover),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
                child: Text(
                  topicDetailEntity.text??"",
                  style: TextStyle(fontSize: 12, color: Color(0xff9a9a9a)),
                ),
              ),
             /* Container(
                height: 10,
                color: Colors.black12,
              )*/
            ],
          ),
          Positioned(
              left: 20,
              right: 20,
              top: 230,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    topicDetailEntity.brief??"",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xFFF5F5F5)),
                      borderRadius: BorderRadius.circular(4))))
        ],
      ),
    );
  }
}