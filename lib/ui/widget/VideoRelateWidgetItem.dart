import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/utils/DateUtil.dart';
import 'package:flutter_eye/utils/NavigatorUtil.dart';

class VideoRelateWidgetItem extends StatelessWidget {
  final Data data;

  const VideoRelateWidgetItem({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigatorUtil.toDetailself(context, data);
      },
      child: Container(

        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: _coverWidget(),
                ),
                Positioned(
                    right: 5,
                    bottom: 5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                            decoration: BoxDecoration(color: Colors.black54),
                            padding: EdgeInsets.all(3),
                            child: Text(
                              DateUtil.formatDateMsByMS(
                                  data.duration * 1000),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ))))
              ],
            ),
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child:
                        Text('#${data.category} / ${data.author?.name}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )),
                      ),
                    ],
                  ),
                ))

          ],
        ),
      ),
    );
  }

  Widget _coverWidget() {
    return Hero(
        tag: '${data.id}${data.time}',
        child: CachedNetworkImage(
            imageUrl: data.cover.detail,
            errorWidget: (context, url, error) =>
                Image.asset('images/img_load_fail.png'),
            width: 135,
            height: 80,
            fit: BoxFit.cover));
  }
}
