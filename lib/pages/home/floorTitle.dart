import 'package:flutter/material.dart';

//楼层标题
class FloorTitle extends StatelessWidget {
  final String pictureAddress; // 图片地址
  FloorTitle({Key key, this.pictureAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: Image.network(pictureAddress),
      decoration: BoxDecoration(
        color: Color(0xfff0f0f0)
      ),
    );
  }
}
