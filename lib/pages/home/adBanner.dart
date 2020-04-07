import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//广告图片
class AdBanner extends StatelessWidget {
  final String advertesPicture; //广告图片地址
  final String jumpAddress; //点击跳转地址

  AdBanner({Key key, this.advertesPicture, this.jumpAddress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0),
      color: Colors.white,
      child: InkWell(
        child: Image.network(advertesPicture),
        onTap: () async {
          if (await canLaunch(jumpAddress)) {
            await launch(jumpAddress);
          } else {
            throw '不能跳转到URL异常: $jumpAddress';
          }
        },
      ),
    );
  }
}
