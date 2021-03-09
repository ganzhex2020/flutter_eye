import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/utils/toast_util.dart';

import 'PagingListViewModel.dart';

class CategoryDetailViewModel extends BaseChangeNotifierModel/*PagingListVieModel<Item,Issue>*/{

  int categoryId;
  String nextPageUrl;
  EasyRefreshController easyRefreshController = EasyRefreshController();
  ScrollController scrollController = ScrollController();
  bool expend = true;
  List<Item> itemList = [];


  CategoryDetailViewModel(this.categoryId);

  Future<void> refresh() {
    String url = Api.category_list_url+"id=$categoryId&udid=d2807c895f0348a180148c9dfa6f2feeac0781b5&deviceModel=Android";
    HttpUtil.getInstance().get(url,
        success: (result) async{

          Issue issue = Issue.fromJson(result);
          itemList = issue.itemList;
          nextPageUrl = issue.nextPageUrl;
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

  Future<void> loadMore() async {
    String url = nextPageUrl +
        "&udid=d2807c895f0348a180148c9dfa6f2feeac0781b5&deviceModel=Android";
    if(nextPageUrl == null){
      easyRefreshController.finishLoad(noMore: true);
      return;
    }
    HttpUtil.getInstance().get(url,
        success: (result) async{

          Issue issue = Issue.fromJson(result);
          itemList.addAll(issue.itemList);
          nextPageUrl = issue.nextPageUrl;

          if(nextPageUrl==null){
            easyRefreshController.finishLoad(noMore: true);
          }else{
            easyRefreshController.finishLoad();
          }
          notifyListeners();
        },
        fail: (e) {
          ToastUtil.showError((e as ApiException).errorMsg);
          easyRefreshController.finishLoad(success: false);
        });

  }

  retry() {
    loading = true;
    notifyListeners();
    refresh();
  }

  /*@override
  String getUrl() {
    return Api.category_list_url+"id=$categoryId&udid=d2807c895f0348a180148c9dfa6f2feeac0781b5&deviceModel=Android";
  }

  @override
  Issue getModel(Map<String, dynamic> json) {
    return Issue.fromJson(json);
  }*/

  void changeExpendStatusByOffset(int statusBarHeight, int offset) {
    if (offset > statusBarHeight && offset < 250) {
      if (!expend) {
        expend = true;
      }
    } else {
      if (expend) {
        expend = false;
      }
    }
  }


}

