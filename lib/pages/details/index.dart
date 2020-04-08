import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import './detailsPage/detailsBottom.dart';
import './detailsPage/detailsExplain.dart';
import './detailsPage/detailsTabBar.dart';
import './detailsPage/detailsTopArea.dart';
import './detailsPage/detailsWeb.dart';

import '../../provide/detailsInfo.dart';
import '../../util/dialog/progressDialog.dart'; //加载动画
import '../../util/animation/circle.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  bool _loading = true;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('返回上一页');
              Navigator.pop(context);
            },
          ),
          title: Text('商品详细页'),
        ),
        body: FutureBuilder(
            future: _getBackInfo(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                _loading = false;
                return Stack(
                  children: <Widget>[
                    ListView(
                      children: <Widget>[
                        DetailsTopArea(),
                        DetailsExplain(),
                        DetailsTabBar(),
                        DetailsWeb(),
                      ],
                    ),
                    Positioned(bottom: 0, left: 0, child: DetailsBottom())
                  ],
                );
              } else {
                return Container(
                child: ProgressDialog(
                  loading: _loading,
                  progress: Circle(
                    size: Size(100.0, 20.0),
                    color: Color(0xff41B5F1),
                ),
                alpha: 0,
            ));
              }
            }));
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return '完成加载';
  }
}
