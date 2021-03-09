


import 'dart:io';

import 'package:flutter_eye/entity/news_list_entity.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/viewmodel/PagingListViewModel.dart';

class NewsListViewModel extends PagingListVieModel<ItemList,NewsListEntity>{


  @override
  String getUrl() {
    String deviceModel = Platform.isAndroid ? "Android" : "IOS";
    return Api.news_url + deviceModel;
  }

  @override
  String getNextUrl(NewsListEntity newsListEntity) {
    String deviceModel = Platform.isAndroid ? "Android" : "IOS";
    return "${newsListEntity.nextPageUrl}&vc=6030000&deviceModel=$deviceModel";
  }

  @override
  NewsListEntity getModel(Map<String, dynamic> json) {
    return NewsListEntity.fromJson(json);
  }
}