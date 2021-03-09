

import 'package:flutter_eye/http/HttpUtil.dart';
import 'package:flutter_eye/http/api.dart';

class RemoteRepo{

  Future<String> getBanner() async{
    //return new Future.delayed(const Duration(seconds: 1) ,()=>"获取banner success");
    var result = await HttpUtil.getInstance().get(Api.feed_url);
    //print("banner:"+result);
    return "xxx";
  }
}