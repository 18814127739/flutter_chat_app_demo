import 'package:flutter/material.dart';

class MenuVO {
  String title;
  String imagePath;
  Icon icon;
  String pagePath;

  MenuVO({@required this.title, this.imagePath, this.icon, this.pagePath});
}

List<List<MenuVO>> menuData = [
  [
    MenuVO(
      title: '好友动态',
      imagePath: 'images/icon_me_friends.png',
      pagePath: '/friends',
    )
  ],
  [
    MenuVO(
      title: '消息管理',
      imagePath: 'images/icon_me_message.png',
    ),
    MenuVO(
      title: '我的相册',
      imagePath: 'images/icon_me_photo.png',
    ),
    MenuVO(
      title: '我的文件',
      imagePath: 'images/icon_me_file.png',
    ),
    MenuVO(
      title: '联系客服',
      imagePath: 'images/icon_me_service.png',
    ),
  ],
  [
    MenuVO(
      title: '清理缓存',
      imagePath: 'images/icon_me_clear.png',
    ),
  ]
];