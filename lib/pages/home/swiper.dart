import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../router/application.dart';

//轮播组件
class SwiperShow extends StatelessWidget {
  final List swiperDataList; //轮播数据

  SwiperShow({Key key, this.swiperDataList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(400),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Application.router.navigateTo(
                  context, "/detail?id=${swiperDataList[index]['goodsId']}"
              );
            },
            child: Image.network("${swiperDataList[index]['image']}",
                fit: BoxFit.fill),
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
