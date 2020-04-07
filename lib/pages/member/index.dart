import 'package:flutter/material.dart';

import './memberHeader.dart';
import './memberOrderTitle.dart';
import './memberOrderTypes.dart';
import './memberOptionItem.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('会员中心'),
     ),
     body:ListView(
       children: <Widget>[
          MemberHeader(),
          MemberOrderTitle(),
          MemberOrderTypes(),
          MemberOptionItem(),
       ],
     ) ,
   );
  }
}