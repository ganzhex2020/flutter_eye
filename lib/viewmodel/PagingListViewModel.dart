import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/PagingEntity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/utils/toast_util.dart';

abstract class PagingListVieModel<T, M extends PagingEntity<T>>
    extends BaseChangeNotifierModel {

  List<T> itemList = [];
  String nextPageUrl;
  EasyRefreshController easyRefreshController = EasyRefreshController();
  ScrollController scrollController = ScrollController();

  Future<void> refresh() {
    HttpUtil.getInstance().get(getUrl(),
        success: (result) async{

          M model = getModel(result);
          itemList = model.itemList;
          nextPageUrl = getNextUrl(model);
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
    if(nextPageUrl == null){
      easyRefreshController.finishLoad(noMore: true);
      return;
    }
    HttpUtil.getInstance().get(nextPageUrl,
        success: (result) async{

          M model = getModel(result);
          itemList.addAll(model.itemList);
          nextPageUrl = getNextUrl(model);

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

  String getUrl();

  String getNextUrl(M model){
    return model.nextPageUrl;
  }

  M getModel(Map<String, dynamic> json);


}
