import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.note, text: 'Thông báo', onTap: () {}),
          _createDrawerItem(
              icon: Icons.contacts, text: 'Hoạt động', onTap: () {}),
          _createDrawerItem(icon: Icons.event, text: 'Sự kiện', onTap: () {}),
          _createDrawerItem(icon: Icons.face, text: 'Bạn bè', onTap: () {}),
          Divider(),
          _createDrawerItem(
              icon: Icons.collections_bookmark, text: 'Thống kê', onTap: () {}),
          _createDrawerItem(
              icon: Icons.account_box, text: 'Tài khoản', onTap: () {}),
          _createDrawerItem(icon: Icons.stars, text: 'Trợ giúp', onTap: () {}),
          Divider(),
          _createDrawerItem(
              icon: Icons.bug_report, text: 'Báo cáo', onTap: () {}),
          ListTile(
            title: Text('Ver 1.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image:
                    AssetImage('assets/images/drawer_header_background.png'))),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text('UserName',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600))),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: Colors.black87.withOpacity(0.65)),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
