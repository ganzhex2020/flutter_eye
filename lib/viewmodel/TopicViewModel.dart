

import 'package:flutter_eye/entity/topic_entity.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/viewmodel/PagingListViewModel.dart';

class TopicViewModel extends PagingListVieModel<TopicItem,TopicEntity>{
  @override
  TopicEntity getModel(Map<String,dynamic > json) {
    return TopicEntity.fromJson(json);
  }

  @override
  String getUrl() {
    return Api.topics_url;
  }

}