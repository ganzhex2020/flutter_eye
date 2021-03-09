

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye/entity/news_list_entity.dart';
import 'package:flutter_eye/utils/NavigatorUtil.dart';

class NewsTitleWidgetItem extends StatelessWidget{

  final ItemList itemList;

  const NewsTitleWidgetItem({Key key, this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: Text(itemList.data.text,
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff3f3f3f))),
    );
  }
}

class NewsContentWidgetItem extends StatelessWidget{

  final ItemList itemList;

  const NewsContentWidgetItem({Key key, this.itemList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          String url = Uri.decodeComponent(itemList.data.actionUrl
              .substring(itemList.data.actionUrl.indexOf("url")));
          url = url.substring(4, url.length);
          NavigatorUtil.toWebView(context, url);
        },
        child: Padding(
            padding: EdgeInsets.all(10),
            child: PhysicalModel(
              color: Color(0xFFEDEDED),
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width,
                            height: 140,
                            imageUrl: itemList.data.backgroundImage,
                            errorWidget: (context, url, error) =>
                                Image.asset('images/img_load_fail.png'),
                            fit: BoxFit.fill),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _getTitleList(itemList.data.titleList),
                      )
                    ],
                  )),
            ))

    );
  }

  List<Widget> _getTitleList(List<String> titleList) {
    return titleList.map((title) {
      return Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Text(title,
              style: TextStyle(color: Color(0xff333333), fontSize: 12),
              maxLines: 3,
              overflow: TextOverflow.ellipsis));
    }).toList();
  }
}

