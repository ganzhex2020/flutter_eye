import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/repository/RemoteRepo.dart';
import 'package:flutter_eye/utils/toast_util.dart';

class HomeViewModel extends BaseChangeNotifierModel {
//  RemoteRepo _remoteRepo;
  List<Item> bannerList = [];
  List<Item> itemList = [];
  String nextPageUrl;
  EasyRefreshController easyRefreshController = EasyRefreshController();
  ScrollController scrollController = ScrollController();




  Future<void> refresh() {
     HttpUtil.getInstance().get(Api.feed_url,
        success: (result) async{

          IssueEntity issueEntity = IssueEntity.fromJson(result);
          List<Item> list = issueEntity.issueList[0].itemList;
          list.removeWhere((element) => element.type == 'banner2');
          bannerList = list;
          itemList.clear();
          itemList.add(Item()); //为Banner占位
          error = false;

          nextPageUrl = issueEntity.nextPageUrl;
          easyRefreshController.finishRefresh();
          await loadMore();
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
    if(nextPageUrl == null){
      easyRefreshController.finishLoad(noMore: true);
      return;
    }
    HttpUtil.getInstance().get(nextPageUrl,
        success: (result) async{

          IssueEntity issueEntity = IssueEntity.fromJson(result);
          List<Item> list = issueEntity.issueList[0].itemList;
          list.removeWhere((element) => element.type == 'banner2');

          itemList.addAll(list);

          nextPageUrl = issueEntity.nextPageUrl;
          if(list.length==null){
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
}
