import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';  //引入使用状态管理
import 'dart:convert';

import '../../provide/childCategory.dart';
import '../../provide/categoryGoodsList.dart';
import '../../model/category.dart';
import '../../model/categoryGoodsList.dart';
import '../../service/serviceMethod.dart' as HttpMethod;

class LeftCategoryNav extends StatefulWidget {
  LeftCategoryNav({Key key}) : super(key: key);
  
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  var listIndex = 0; //索引

  @override
  void initState() {
    _getCategory();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Provide<ChildCategory>(
      builder: (context, child, val) {
        _getGoodList(context);
        listIndex = val.categoryIndex;

        return Container(
          width: ScreenUtil().setWidth(180),
          decoration: BoxDecoration(
              border:
                  Border(right: BorderSide(width: 1, color: Colors.black12))),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _leftInkWel(index);
            },
          ),
        );
      },
    );
  }

  Widget _leftInkWel(int index) {
    bool isClick = false;
    isClick = (index == listIndex) ? true : false;

    return InkWell(
      onTap: () {
        var childList = list[index].bxMallSubDto;
        var categoryId = list[index].mallCategoryId;
        Provide.value<ChildCategory>(context).changeCategory(categoryId, index);
        Provide.value<ChildCategory>(context)
            .getChildCategory(childList, categoryId);
        _getGoodList(context, categoryId: categoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
            color: isClick ? Color.fromRGBO(236, 238, 239, 1.0) : Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          list[index].mallCategoryName,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }

  //得到后台大类数据
  void _getCategory() async {
    await HttpMethod.getCategory().then((val) {
      var data = json.decode(val.toString());

      CategoryModel category = CategoryModel.fromJson(data);

      setState(() {
        list = category.data;
      });
      
      Provide.value<ChildCategory>(context)
          .getChildCategory(list[0].bxMallSubDto, '4');

      //print(list[0].bxMallSubDto);

      //list[0].bxMallSubDto.forEach((item) => print(item.mallSubName));
    });
  }

  //得到商品列表数据
  void _getGoodList(context, {String categoryId}) {
    var data = {
      'categoryId': categoryId == null
          ? Provide.value<ChildCategory>(context).categoryId
          : categoryId,
      'categorySubId': Provide.value<ChildCategory>(context).subId,
      'page': 1
    };

    HttpMethod.getMallGoods(params: data).then((val) {
      var data = json.decode(val.toString());
      CategoryGoodsListModel goodsList = CategoryGoodsListModel.fromJson(data);
      // Provide.value<CategoryGoodsList>(context).getGoodsList(goodsList.data);
      Provide.value<CategoryGoodsListProvide>(context)
          .getGoodsList(goodsList.data);
    });
  }
}
