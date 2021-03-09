import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/entity/category_entity.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/ui/widget/rank_widget_item.dart';
import 'package:flutter_eye/viewmodel/CategoryDetailViewModel.dart';

class CategoryDetailPage extends StatefulWidget {
  final CategoryEntity categoryEntity;

  const CategoryDetailPage(this.categoryEntity);

  @override
  State<StatefulWidget> createState() => _CategoryDetail();
}

class _CategoryDetail extends State<CategoryDetailPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CategoryDetailViewModel>(
        viewModel: CategoryDetailViewModel(widget.categoryEntity.id),
        onModelInit: (model) {
          model.refresh();
        },
        builder: (context, model, child) {
          return NestedScrollView(
            //支持嵌套滚动
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: Colors.black)),
                    elevation: 0,
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    expandedHeight: 200.0,
                    pinned: true,
                    flexibleSpace:
                        LayoutBuilder(builder: (context, constraints) {
                      model.changeExpendStatusByOffset(
                          (MediaQuery.of(context).padding.top).toInt() + 56,
                          constraints.biggest.height.toInt());
                      return FlexibleSpaceBar(
                          title: Text(
                            widget.categoryEntity.name,
                            style: TextStyle(color:  model.expend
                            ? Colors.white
                                : Colors.black),
                          ),
                          centerTitle: false,
                          background: Hero(
                            tag: widget.categoryEntity.tagId,
                            child: CachedNetworkImage(
                                imageUrl: widget.categoryEntity.headerImage,
                                fit: BoxFit.cover),
                          ));
                    }))
              ];
            },
            body: LoadingContainer(
              loading: model.loading,
              error: model.error,
              retry: model.retry,
              child: EasyRefresh(
                controller: model.easyRefreshController,
                //     scrollController: viewModel.scrollController,
                onRefresh: () async {
                  model.refresh();
                },
                onLoad: () async {
                  model.loadMore();
                },

                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return RankWidgetItem(item: model.itemList[index]);
                    },
                    /* separatorBuilder: (context, index) {
                    return Divider(height: 0.5);
                  },*/
                    itemCount: model.itemList.length),
              ),
            ),
          );
          /* return LoadingContainer(
              loading: model.loading,
              error: model.error,
              retry: model.retry,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    leading: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: Colors.black)),
                    elevation: 0,
                    brightness: Brightness.light,
                    backgroundColor: Colors.white,
                    expandedHeight: 200.0,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        widget.categoryEntity.name,
                        style: TextStyle(color: Colors.white),
                      ),
                      centerTitle: false,
                      background: CachedNetworkImage(
                          imageUrl: widget.categoryEntity.headerImage,
                          fit: BoxFit.cover),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {

                      }))
                ],
              ));*/
        });
  }
}
