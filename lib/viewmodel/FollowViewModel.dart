import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/utils/toast_util.dart';
import 'package:flutter_eye/viewmodel/PagingListViewModel.dart';

class FollowViewModel extends PagingListVieModel<Item,Issue>{


  @override
  String getUrl() => Api.follow_url;

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }
}