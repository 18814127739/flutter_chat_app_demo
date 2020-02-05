import 'package:flutter/material.dart';
import './touch_callback.dart';

class ImItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final Icon icon;
  final String pagePath;

  ImItem(
      {Key key, @required this.title, this.imagePath, this.icon, this.pagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchCallBack(
      onPressed: () {
        if (pagePath != null) {
          Navigator.pushNamed(context, pagePath);
        }
      },
      child: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 22, right: 20),
              child: imagePath != null
                  ? Image.asset(
                      imagePath,
                      width: 32,
                      height: 32,
                    )
                  : SizedBox(
                      height: 32,
                      width: 32,
                      child: icon,
                    ),
            ),
            Text(title,
                style: TextStyle(fontSize: 16, color: Color(0xff353535))),
          ],
        )),
    );
  }
}
