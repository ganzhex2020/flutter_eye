import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/entity/category_entity.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/utils/NavigatorUtil.dart';
import 'package:flutter_eye/viewmodel/CategoryViewModel.dart';

import 'CategoryDetailPage.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CategoryViewModel>(
      viewModel: CategoryViewModel(),
      onModelInit: (model) {
        model.getCategoryData();
      },
      builder: (context, model, child) {
        return LoadingContainer(
            loading: model.loading,
            error: model.error,
            retry: model.retry,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(color: Color(0xfff2f2f2)),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
                children: model.categoryList
                    .map((e) => CategoryItem(context, e))
                    .toList(),
              ),
            ));
      },
    );
  }

  Widget CategoryItem(BuildContext context, CategoryEntity categoryEntity) {
    return OpenContainer(
      closedBuilder: (context, action) {
        return Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Hero(
                  tag: categoryEntity.tagId,
                  child: CachedNetworkImage(imageUrl: categoryEntity.bgPicture),
                )),
            Center(
                child: Text('#${categoryEntity.name}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)))
          ],
        );
      },
      openBuilder: (context, action) {
        return CategoryDetailPage(categoryEntity);
      },
      /*  onTap:()=> NavigatorUtil.toCategoryDetail(context, categoryEntity),
      child:  Container(
        child:   Stack(children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(imageUrl: categoryEntity.bgPicture)),
          Center(
              child: Text('#${categoryEntity.name}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)))
        ]),
      ),*/
    );
  }

  @override
  bool get wantKeepAlive => true;
}
