import "package:flutter/material.dart";
import "./chat/message_page.dart";
import "./contacts/contacts.dart";
import "./personal/personal.dart";

final List tabData = [
  {
    "title": '聊天',
    "activeImg": "images/message_pressed.png",
    "normalImg": "images/message_normal.png",
  },
  {
    "title": '好友',
    "activeImg": "images/contact_list_pressed.png",
    "normalImg": "images/contact_list_normal.png",
  },
  {
    "title": '我的',
    "activeImg": "images/profile_pressed.png",
    "normalImg": "images/profile_normal.png",
  }
];

class App extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  int _currentIndex = 0;
  // 聊天页面
  MessagePage message;
  // 好友页面
  Contacts contacts;
  // 我的页面s
  Personal me;

  renderCurrentPage() {
    switch (_currentIndex) {
      case 0:
        if (message == null) {
          message = MessagePage();
        }
        return message;
      case 1:
        if (contacts == null) {
          contacts = Contacts();
        }
        return contacts;
      case 2:
        if (me == null) {
          me = Personal();
        }
        return me;
      default:
    }
  }

  // 渲染某个菜单项, 传入菜单标题、图片路径or图标
  renderPopupMenuItem(String title, {String imagePath, IconData icon}) {
    return PopupMenuItem(
        child: Row(
      children: <Widget>[
        imagePath != null
            ? Image.asset(imagePath, width: 32.0, height: 32.0)
            : SizedBox(
                width: 32.0,
                height: 32.0,
                child: Icon(icon, color: Colors.white),
              ),
        Container(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    ));
  }

  renderBottomNavigationBarItem(Map<String, String> tabItem, index) {
    return BottomNavigationBarItem(
      title: Text(
        tabItem["title"],
        style: TextStyle(
          color: _currentIndex == index ? Color(0xFF46c01b) : Color(0xff999999),
        ),
      ),
      icon: Image.asset(
        _currentIndex == index
            ? tabItem["activeImg"]
            : tabItem["normalImg"],
        width: 32.0,
        height: 28.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('即时通讯'),
        actions: <Widget>[
          GestureDetector(
            child: Icon(Icons.search),
            // 跳转至搜索页面
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                // 弹出菜单
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(500.0, 76.0, 10.0, 0.0),
                    items: <PopupMenuEntry>[
                      renderPopupMenuItem('发起会话',
                          imagePath: 'iamges/icon_menu_group.png'),
                      renderPopupMenuItem('添加好友',
                          imagePath: 'iamges/icon_menu_addfriend.png'),
                      renderPopupMenuItem('联系客服', icon: Icons.person),
                    ]);
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: renderCurrentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          renderBottomNavigationBarItem(tabData[0], 0),
          renderBottomNavigationBarItem(tabData[1], 1),
          renderBottomNavigationBarItem(tabData[2], 2),
        ],
      ),
    );
  }
}
