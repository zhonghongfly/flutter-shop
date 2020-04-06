import 'package:flutter/material.dart';
import './pages/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '斯贝儿',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue
        ),
        home: IndexPage(),
      )
    );
  }
}
