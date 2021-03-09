

import 'package:flutter_eye/base/BaseChangeNotifierModel.dart';
import 'package:flutter_eye/entity/category_entity.dart';
import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';
import 'package:flutter_eye/utils/toast_util.dart';

class CategoryViewModel extends BaseChangeNotifierModel{

  List<CategoryEntity> categoryList = [];


  Future<void> getCategoryData() {
    HttpUtil.getInstance().get(Api.category_url,
        success: (result) async{
          List resultList = result as List;
          categoryList = resultList.map((e) => CategoryEntity.fromJson(e)).toList();

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

  retry(){
    loading = true;
    notifyListeners();
    getCategoryData();
  }

}