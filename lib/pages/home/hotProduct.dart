import 'package:flutter/material.dart';
import '../../router/application.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HotProduct extends StatefulWidget {
  final List<Map> hotGoodsList; //火爆商品列表
  HotProduct(this.hotGoodsList, {Key key}) : super(key: key);

  @override
  _HotProductState createState() => _HotProductState(hotGoodsList: this.hotGoodsList);
}

class _HotProductState extends State<HotProduct> {
  List<Map> hotGoodsList; //火爆商品列表
  _HotProductState({this.hotGoodsList}); //接收参数并赋值
  @override
  Widget build(BuildContext context) {
    return Container(
      child: _warpList(),
    );
  }

  Widget _warpList() {
    if (hotGoodsList.length > 0) {
      List<Widget> listWidget = hotGoodsList.map((val) {
        return InkWell(
            onTap: () {
              Application.router
                  .navigateTo(context, "/detail?id=${val['goodsId']}");
            },
            child: Container(
              width: ScreenUtil().setWidth(500),
              color: Colors.white,
              padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                children: <Widget>[
                  Image.network(
                    val['image'],
                    width: ScreenUtil().setWidth(500),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    val['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, 
                        fontSize: ScreenUtil().setSp(30),
                      ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '￥${val['mallPrice']}',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '￥${val['price']}',
                        style: TextStyle(
                            color: Colors.black26,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )
                ],
              ),
            ));
      }).toList();

      return Wrap(
        spacing: 2,
        alignment: WrapAlignment.spaceEvenly,
        children: listWidget,
      );
    } else {
      return Text('Not Data', textAlign: TextAlign.center,);
    }
  }
}
