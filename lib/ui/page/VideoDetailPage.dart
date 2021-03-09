import 'package:cached_network_image/cached_network_image.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/common/SizeConfig.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/ui/widget/VideoRelateWidgetItem.dart';
import 'package:flutter_eye/utils/DateUtil.dart';
import 'package:flutter_eye/viewmodel/VideoDetailViewModel.dart';

class VideoDetailPage extends StatefulWidget {
  final Data data;

  VideoDetailPage({@required this.data});

  @override
  State createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.data.playUrl, autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<VideoDetailVideModel>(
        viewModel: VideoDetailVideModel(widget.data.id),
        onModelInit: (model) {
          model.getRelateVideo();
        },
        builder: (context, model, child) {

          return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    Hero(
                      tag: '${widget.data.id}${widget.data.time}',
                      child: Container(
                          alignment: Alignment.center,
                          child: FijkView(
                            color: Colors.black,
                            fit: FijkFit.fill,
                            width: SizeConfig.blockSizeHorizontal*100,
                            height: SizeConfig.blockSizeVertical*35,
                            player: player,
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: LoadingContainer(
                        loading: model.loading,
                        error: model.error,
                        retry: model.retry,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(
                                      '${widget.data.cover.blurred}}/thumbnail/${MediaQuery.of(context).size.height}x${MediaQuery.of(context).size.width}'))),
                          child: CustomScrollView(
                            slivers: <Widget>[
                              SliverToBoxAdapter(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                            widget.data.title,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Text(
                                              '#${widget.data.category} / ${DateUtil.formatDateMsByYMDHM(widget.data.author.latestReleaseTime)}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10, right: 10),
                                          child: Text(widget.data.description,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, top: 10),
                                          child: Row(
                                            children: <Widget>[
                                              Image.asset(
                                                'images/ic_like.png',
                                                height: 22,
                                                width: 22,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3),
                                                child: Text(
                                                  '${widget.data.consumption.collectionCount}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 30),
                                                child: Image.asset(
                                                  'images/ic_share_white.png',
                                                  height: 22,
                                                  width: 22,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3),
                                                child: Text(
                                                  '${widget.data.consumption.shareCount}',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.only(left: 30),
                                                child: Image.asset(
                                                  'images/icon_comment.png',
                                                  height: 22,
                                                  width: 22,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                EdgeInsets.only(
                                                    left: 3),
                                                child: Text(
                                                  '${widget.data.consumption.replyCount}',
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white,
                                                      fontSize: 13),
                                                ),
                                              )
                                            ],
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(top: 10),
                                          child: Divider(
                                              height: 0.5,
                                              color: Colors.white)),
                                      Divider(
                                          height: 0.5, color: Colors.white)
                                    ]),
                              ),
                              SliverList(
                                  delegate: SliverChildBuilderDelegate((context,index){
                                    if(model.itemList[index].type == 'textCard'){
                                      return Padding(padding: EdgeInsets.all(10),child: Text(
                                        model.itemList[index].data.text,
                                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                                      ));
                                    }
                                    else{
                                      return VideoRelateWidgetItem(data: model.itemList[index].data);
                                    }
                                  }
                                  ,childCount: model.itemList.length
                                  ),

                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ));
        });
  }


}
