import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberHeader extends StatelessWidget {
  const MemberHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(400),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Container(
            //用户头像
            margin: EdgeInsets.only(top: 30),
            child: ClipOval(
              child: Image.asset(
                "images/head.png", 
                width: 120,
              ),
            ),
          ),
          Container(
            //用户昵称
            margin: EdgeInsets.only(top: 10),
            child: Text(
              "初夏怜殇",
              style: TextStyle(
                color: Color(0xFF8C7BFD),
                fontSize: ScreenUtil().setSp(36),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
