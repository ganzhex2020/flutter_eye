import 'package:flutter/material.dart';
import 'package:flutter_eye/entity/category_entity.dart';
import 'package:flutter_eye/entity/issue_entity.dart';
import 'package:flutter_eye/ui/page/CategoryDetailPage.dart';
import 'package:flutter_eye/ui/page/VideoDetailPage.dart';
import 'package:flutter_eye/ui/page/WebPage.dart';

class NavigatorUtil {
  static void toDetails(BuildContext context, Data data) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new VideoDetailPage(data: data)));
  }

  static void toDetailself(BuildContext context, Data data) {
    Navigator.pushReplacement(
        context,
        new MaterialPageRoute(
            builder: (context) => new VideoDetailPage(data: data)));
  }

  static void toCategoryDetail(BuildContext context, CategoryEntity categoryEntity) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new CategoryDetailPage(categoryEntity)));

  }

  static void toWebView(BuildContext context, String url) {
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => new WebPage(url: url)));
  }

}
