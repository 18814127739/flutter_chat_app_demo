import 'package:flutter/material.dart';
import '../common/touch_callback.dart';
import '../common/im_item.dart';
import './menu_vo.dart';

class Personal extends StatelessWidget {

  List<Widget> renderMenuGroupItem(List<MenuVO> menuGroupItem) {
    List<Widget> menuGroup = menuGroupItem.map((item) => Column(
      children: <Widget>[
        // 判断是否每个菜单组的第一个菜单, 第一个菜单不用加border
        item == menuGroupItem.first ? ImItem(
          title: item.title,
          imagePath: item.imagePath != null ? item.imagePath : null,
          icon: item.icon != null ? item.icon : null,
          pagePath: item.pagePath != null ? item.pagePath : null,
        ) : 
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                height: 0.5,
                color: Color(0xffd9d9d9),
              ),
            ),
            ImItem(
              title: item.title,
              imagePath: item.imagePath != null ? item.imagePath : null,
              icon: item.icon != null ? item.icon : null,
            ),
          ],
        )
      ],
    )).toList();
    return menuGroup;
  }

  List<Widget> renderMenus() {
    List<Widget> menuList = menuData.map((item) => Container(
      margin: EdgeInsets.only(top: 20),
      color: Colors.white,
      child: Column(
        children: renderMenuGroupItem(item),
      ),
    )).toList();
    return menuList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.only(top: 20),
            color: Colors.white,
            height: 80.0,
            child: TouchCallBack(
              onPressed: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 15),
                    child: Image.asset('images/yixiu.jpeg', width: 70, height: 70),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('一休', style: TextStyle(fontSize: 18, color: Color(0xff353535))),
                        Text('账号yixiu', style: TextStyle(fontSize: 14, color: Color(0xffa9a9a9))),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 12, right: 15),
                    child: Image.asset('images/code.png', width: 24, height: 24),
                  ),
                ]
              )
            )
          ),
          ...renderMenus(),
        ],
      )
    );
  }
}