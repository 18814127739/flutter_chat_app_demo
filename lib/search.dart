import "package:flutter/material.dart";
import "./common/touch_callback.dart";

class Search extends StatefulWidget {

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  FocusNode focusNode = FocusNode();

  requestFocus() {
    FocusScope.of(context).requestFocus(focusNode);
    return focusNode;
  }

  getText(String text) {
    return TouchCallBack(
      isfeed: false,
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0, color: Color(0xff1aad19)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 25.0),
        child: Column(
          // 水平方向居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // 顶部导航栏, 包括返回按钮, 搜索框及麦克风
            Padding(padding: EdgeInsets.only(top: 10)),
            Stack(
              children: <Widget>[
                TouchCallBack(
                  isfeed: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45.0,
                    margin: EdgeInsets.only(left: 12.0, right: 10.0),
                    child: Icon(Icons.chevron_left, color: Colors.black),
                  )
                ),
                // 搜索框
                Container(
                  alignment: Alignment.centerLeft,
                  height: 45.0,
                  margin: EdgeInsets.only(left: 50.0, right: 10.0),
                  // 搜索框底部边框
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 1.0, color: Colors.green))
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          // 请求获取焦点
                          focusNode: requestFocus(),
                          style: TextStyle(color: Colors.black, fontSize: 16.0),
                          onChanged: (String text) {},
                          decoration: InputDecoration(
                            hintText: '搜索',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.mic, color: Color(0xffaaaaaa)),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Text(
                '常用搜索',
                style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
              )
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  getText('朋友'),
                  getText('聊天'),
                  getText('群组'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30, right: 39),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  getText('Flutter'),
                  getText('Dart'),
                  getText('C++'),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}