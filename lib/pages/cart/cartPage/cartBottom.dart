import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../../../provide/cart.dart';

class CartBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5.0),
        color: Colors.white,
        width: ScreenUtil().setWidth(750),
        child: Provide<CartProvide>(
          builder: (context, child, childCategory) {
            return Row(
              children: <Widget>[
                selectAllBtn(context),
                allPriceArea(context),
                goButton(context)
              ],
            );
          },
        ));
  }

  //全选按钮
  Widget selectAllBtn(context) {
    bool isAllCheck = Provide.value<CartProvide>(context).isAllCheck;
    return Container(
      child: Row(
        children: <Widget>[
          Checkbox(
            value: isAllCheck,
            activeColor: Color(0xffF3270C),
            onChanged: (bool val) {
              Provide.value<CartProvide>(context).changeAllCheckBtnState(val);
            },
          ),
          Text('全选')
        ],
      ),
    );
  }

  // 合计区域
  Widget allPriceArea(context) {
    double allPrice = Provide.value<CartProvide>(context).allPrice;

    return Container(
      width: ScreenUtil().setWidth(400),
      alignment: Alignment.centerRight,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                width: ScreenUtil().setWidth(200),
                child: Text('合计:',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: ScreenUtil().setWidth(200),
                child: Text('￥${allPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(36),
                      color: Colors.red,
                    )),
              )
            ],
          ),
          Container(
            width: ScreenUtil().setWidth(360),
            alignment: Alignment.centerRight,
            child: Text(
              '满50免减100,特价优惠',
              style: TextStyle(
                  color: Colors.black38, fontSize: ScreenUtil().setSp(22)),
            ),
          )
        ],
      ),
    );
  }

  //结算按钮
  Widget goButton(context) {
    int allGoodsCount = Provide.value<CartProvide>(context).allGoodsCount;
    return Container(
      width: ScreenUtil().setWidth(180),
      padding: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Color(0xffF11C0C), borderRadius: BorderRadius.circular(3.0)),
          child: Text(
            '结算($allGoodsCount)',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
