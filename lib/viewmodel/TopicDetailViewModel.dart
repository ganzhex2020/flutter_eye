
import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/topic_detail_entity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/utils/toast_util.dart';

class TopicDetailViewModel extends BaseChangeNotifierModel{

  int _id;
  bool loading = true;
  bool error = false;

  TopicDetailEntity topicDetailEntity = TopicDetailEntity();
  List<TopicDetailItemData> itemList = [];

  TopicDetailViewModel(this._id);

  void getTopicDetailData(){
    HttpUtil.getInstance().get('${Api.topics_detail_url}$_id',
        success: (result) async{
          topicDetailEntity = TopicDetailEntity.fromJson(result);
          itemList = topicDetailEntity.itemList;
        //  print(topicDetailEntity);
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

  retry() {
    loading = true;
    notifyListeners();
    getTopicDetailData();
  }

}