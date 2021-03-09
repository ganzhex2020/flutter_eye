


import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_eye/base/ProviderWidget.dart';
import 'package:flutter_eye/ui/widget/LoadingContainer.dart';
import 'package:flutter_eye/ui/page/FollowPageItem.dart';
import 'package:flutter_eye/viewmodel/FollowViewModel.dart';

class FollowPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _FollowPage();
}

class _FollowPage extends State<FollowPage> with AutomaticKeepAliveClientMixin{


  @override
  Widget build(BuildContext context) {
    return ProviderWidget<FollowViewModel>(
        viewModel: FollowViewModel(),
        onModelInit: (model) {
          model.refresh();
        },
        builder:(context,model,child){
          return LoadingContainer(
              loading: model.loading,
              error: model.error,
              retry: model.retry,
              child: EasyRefresh(
                controller: model.easyRefreshController,
                //     scrollController: viewModel.scrollController,
                onRefresh: ()async{
                  model.refresh();
                },
                onLoad: () async{
                  model.loadMore();
                },

                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return FollowPageItem(item:model.itemList[index]);
                    },
                    separatorBuilder: (context, index) {
                      return Divider(height: 0.5);
                    },
                    itemCount: model.itemList.length),

              )
          );
        }
    );
  }

  @override
  bool get wantKeepAlive =>true;

}