import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'dart:convert';
import '../../service/serviceMethod.dart' as HttpMethod;

import './swiper.dart'; //轮播组件

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  int page = 1;
  List<Map> hotGoodsList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("斯贝儿"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: HttpMethod.getHomePageContext(),
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            var data = json.decode(snapshot.data.toString());
            List<Map> swiperDataList = (data['data']['slides'] as List).cast(); //轮播数据
            // List<Map> navigatorList = (data['data']['category'] as List).cast(); //类别列表
            // String advertesPicture = data['data']['advertesPicture']['PICTURE_ADDRESS']; //广告图片
            // String  leaderImage= data['data']['shopInfo']['leaderImage'];  //店长图片
            // String  leaderPhone = data['data']['shopInfo']['leaderPhone']; //店长电话 
            // List<Map> recommendList = (data['data']['recommend'] as List).cast(); // 商品推荐
            // String floor1Title =data['data']['floor1Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
            // String floor2Title =data['data']['floor2Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
            // String floor3Title =data['data']['floor3Pic']['PICTURE_ADDRESS'];//楼层1的标题图片
            // List<Map> floor1 = (data['data']['floor1'] as List).cast(); //楼层1商品和图片 
            // List<Map> floor2 = (data['data']['floor2'] as List).cast(); //楼层1商品和图片 
            // List<Map> floor3 = (data['data']['floor3'] as List).cast(); //楼层1商品和图片 
            return EasyRefresh(
              header: MaterialHeader(),
              footer: BezierBounceFooter(backgroundColor: Colors.white),
              child: ListView(
                children: <Widget>[
                  SwiperShow(swiperDataList: swiperDataList)
                ]
              ),
              onRefresh: () async {},
              onLoad: () async {
                print('开始加载更多。。。。');
                var formPage = {'page': page};
                await HttpMethod.getHomePageBelowConten(params: formPage).then((val) {
                  var data=json.decode(val.toString());
                    List<Map> newGoodsList = (data['data'] as List ).cast();
                    setState(() {
                      hotGoodsList.addAll(newGoodsList);
                      page++; 
                    });
                });
              },
            );
          } else {
            return Center(child: Text('加载中'),);
          }
        },
      ),
    );
  }
}