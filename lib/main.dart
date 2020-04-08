import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:fluro/fluro.dart';

import './pages/index.dart';
import './provide/childCategory.dart';
import './provide/categoryGoodsList.dart';
import './provide/detailsInfo.dart';
import './provide/cart.dart';
import './provide/currentIndex.dart';
import './provide/counter.dart';

import './router/application.dart';
import './router/routes.dart';

void main() {
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailsInfoProvide = DetailsInfoProvide();
  var cartProvide = CartProvide();
  var currentIndexProvide = CurrentIndexProvide();
  var counter = Counter();
  var providers = Providers();

  providers
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(
        Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    ..provide(Provider<DetailsInfoProvide>.value(detailsInfoProvide))
    ..provide(Provider<CartProvide>.value(cartProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide))
    ..provide(Provider<Counter>.value(counter));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
        child: MaterialApp(
      title: '斯贝儿',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(primaryColor: Color(0xffC82519)),
      home: IndexPage(),
    ));
  }
}
