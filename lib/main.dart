import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './app.dart';
import './loading.dart';
import './search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '聊天室',
      // 自定义主题
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Color(0xFFebebeb),
        cardColor: Colors.green,
      ),
      // 添加路由表
      routes: <String, WidgetBuilder>{
        "app": (BuildContext context) => App(),
        "/friends": (_) => WebviewScaffold(
          url: 'https://flutter.io/',
          appBar: AppBar(
            title: Text("Flutter官网"),
          ),
          withZoom: true,
          withLocalStorage: true,
        ),
        "search": (BuildContext context) => Search(),
      },
      // 指定首页, 默认为加载页面
      home: LoadingPage(),
    );
  }
}