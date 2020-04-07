import 'package:flutter/material.dart';

class HotTitle extends StatelessWidget {
  const HotTitle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.all(10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12)
          )
      ),
      child: Text('火爆专区', style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}
