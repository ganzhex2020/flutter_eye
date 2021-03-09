



import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/entity/topic_detail_entity.dart';
import 'package:flutter_eye/utils/NavigatorUtil.dart';

class TopicDetailWidgetItem extends StatefulWidget{

  final TopicDetailItemData topicDetailItemData;
  TopicDetailWidgetItem(this.topicDetailItemData);

  @override
  State<StatefulWidget> createState() => _TopicDetailWidgetItemState();

}

class _TopicDetailWidgetItemState extends State<TopicDetailWidgetItem>{

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Data data =  widget.topicDetailItemData.data as Data;
            NavigatorUtil.toDetails(context,data);
          },
          child: Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Stack(
              children: <Widget>[
                ClipRRect(

                        child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                            imageUrl: widget.topicDetailItemData.data.header.icon,
                            errorWidget: (context, url, error) =>
                                Image.asset('images/img_load_fail.png'),
                            fit: BoxFit.cover), //充满容器，可能会被截断
                    borderRadius: BorderRadius.circular(4)),

              ],
            ),
          ),
        ),

      ],
    );

  }
}