import 'package:flutter/material.dart';

class MemberOptionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          _optionItem('领取优惠券', Icon(Icons.shopping_basket)),
          _optionItem('已领取优惠券', Icon(Icons.blur_circular)),
          _optionItem('地址管理', Icon(Icons.location_city)),
          _optionItem('客服电话', Icon(Icons.phone)),
          _optionItem('关于我们', Icon(Icons.info)),
        ],
      ),
    );
  }

  Widget _optionItem(String title, Icon icon) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: Colors.black12))),
      child: ListTile(
        leading: icon,
        title: Text(title),
        trailing: Icon(Icons.arrow_right),
      ),
    );
  }
}
