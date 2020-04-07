import 'package:flutter/material.dart';
import 'dart:convert';

import '../service/serviceMethod.dart' as HttpMethod;
import '../model/details.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailsModel goodsInfo;
  bool isLeft = true;
  bool isRight = false;

  //从后台获取商品信息

  getGoodsInfo(String id) async {
    var formData = {
      'goodId': id,
    };

    await HttpMethod.getGoodDetailById(params: formData).then((val) {
      var responseData = json.decode(val.toString());
      goodsInfo = DetailsModel.fromJson(responseData);
      notifyListeners();
    });
  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
