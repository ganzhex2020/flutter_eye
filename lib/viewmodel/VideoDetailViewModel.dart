
import 'dart:collection';

import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/utils/toast_util.dart';

class VideoDetailVideModel extends BaseChangeNotifierModel{


  VideoDetailVideModel(this._videoId);

  int _videoId;
  List<Item> itemList = [];
  bool loading = true;
  bool error = false;


  void getRelateVideo(){
    Map<String,int> map = new HashMap();
    map['id'] = _videoId;
    HttpUtil.getInstance().get(Api.video_related_url,data: map,
        success: (result) async{
          Issue issue = Issue.fromJson(result);
          itemList = issue.itemList;
          error = false;
        },
        fail: (e) {
          error = true;
          ToastUtil.showError((e as ApiException).errorMsg);
        },
        complete: () {
          loading = false;
          notifyListeners();
        });
  }

  void retry() {
    loading = true;
    notifyListeners();
    getRelateVideo();
  }


}