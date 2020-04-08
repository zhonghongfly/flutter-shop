import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import '../../provide/cart.dart';
import './cartPage/cartItem.dart';
import './cartPage/cartBottom.dart';

import '../../util/dialog/progressDialog.dart'; //加载动画
import '../../util/animation/circle.dart';

class CartPage extends StatelessWidget {
  bool _loading;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '购物车', 
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true
      ),
      body: FutureBuilder(
        future: _getCartInfo(context),
        builder: (context, snapshot) {
          List cartList = Provide.value<CartProvide>(context).cartList;
          if (snapshot.hasData && cartList != null) {
            _loading = false;
            return Stack(
              children: <Widget>[
                Provide<CartProvide>(builder: (context, child, childCategory) {
                  cartList = Provide.value<CartProvide>(context).cartList;
                  print(cartList);
                  return ListView.builder(
                    itemCount: cartList.length,
                    itemBuilder: (context, index) {
                      return CartItem(cartList[index]);
                    },
                  );
                }),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: CartBottom(),
                )
              ],
            );
          } else {
            _loading = true;
            return Container(
                child: ProgressDialog(
                  loading: _loading,
                  progress: Circle(
                    size: Size(100.0, 20.0),
                    color: Color(0xff41B5F1),
                ),
                alpha: 0,
            ));
          }
        },
      ),
    );
  }

  Future<String> _getCartInfo(BuildContext context) async {
    await Provide.value<CartProvide>(context).getCartInfo();
    return 'end';
  }
}
