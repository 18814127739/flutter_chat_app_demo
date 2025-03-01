import 'package:flutter/material.dart';
import './contact_vo.dart';

class ContactItem extends StatelessWidget {
  final ContactVO item;
  final String titleName;
  final String imageName;

  ContactItem({this.item, this.titleName, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border:
            Border(bottom: BorderSide(width: 0.5, color: Color(0xffd9d9d9))),
      ),
      height: 52,
      child: FlatButton(
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // 展示头像或图片
              imageName == null
                  ? Image.network(
                      item.avatarUrl != ''
                          ? item.avatarUrl
                          : 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1544070910437&di=86ffd13f433c252d4c49afe822e87462&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fforum%2Fw%3D580%2Fsign%3Debf3e26b1a4c510faec4e21250582528%2F0cf431adcbef76092781a53c2edda3cc7dd99e8e.jpg',
                      width: 36,
                      height: 36,
                      scale: 0.9)
                  : Image.asset(imageName, width: 36, height: 36, scale: 0.9),
              Container(
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  titleName == null ? item.name ?? '暂时' : titleName,
                  style: TextStyle(fontSize: 18, color: Color(0xff353535)),
                  maxLines: 1,
                ),
              )
            ],
          )),
    );
  }
}
