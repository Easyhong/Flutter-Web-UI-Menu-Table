import 'package:admin/menu_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

// ignore: must_be_immutable
class SideMenuTable extends StatelessWidget {
  SideMenuTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child:
            Consumer<MenuChangeNotifier>(builder: (context, contraller, child) {
          return Column(
            children: <Widget>[
              DrawerHeader(
                // margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                // padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  // color: Colors.red,
                  // height: 100,
                  child: Column(
                    children: <Widget>[
                      // Image.asset("assets/images/logo.png"),
                      SvgPicture.asset(
                        "assets/icons/Figma_file.svg",
                        height: 60,
                      ),

                      SizedBox(height: defaultPadding * 0.4),

                      Text(
                        'Argus AI Camera',
                        style: TextStyle(fontSize: 26, color: Colors.blue),
                      ),
                      SizedBox(height: defaultPadding * 0.4),

                      Text(
                        'Argus Technology',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              DrawerListTile(
                title: "The Console",
                svgSrc: "assets/icons/menu_setting.svg",
                isSelect: contraller.index == 0,
                press: () {
                  print("The Console");
                  contraller.selectIndex(0);
                },
              ),
              DrawerListTile(
                title: "Dashbord",
                svgSrc: "assets/icons/menu_dashbord.svg",
                isSelect: contraller.index == 1,
                press: () {
                  print("Dashbord");
                  contraller.selectIndex(1);
                },
              ),
              DrawerListTile(
                title: "Transaction",
                svgSrc: "assets/icons/menu_tran.svg",
                isSelect: contraller.index == 2,
                press: () {
                  contraller.selectIndex(2);
                },
              ),
              DrawerListTile(
                title: "Task",
                svgSrc: "assets/icons/menu_task.svg",
                isSelect: contraller.index == 3,
                press: () {
                  contraller.selectIndex(3);
                },
              ),
              DrawerListTile(
                title: "Documents",
                svgSrc: "assets/icons/menu_doc.svg",
                isSelect: contraller.index == 4,
                press: () {
                  contraller.selectIndex(4);
                },
              ),
              DrawerListTile(
                title: "Store",
                svgSrc: "assets/icons/menu_store.svg",
                isSelect: contraller.index == 5,
                press: () {
                  contraller.selectIndex(5);
                },
              ),
              DrawerListTile(
                title: "Notification",
                svgSrc: "assets/icons/menu_notification.svg",
                isSelect: contraller.index == 6,
                press: () {
                  contraller.selectIndex(6);
                },
              ),
              DrawerListTile(
                title: "Profile",
                svgSrc: "assets/icons/menu_profile.svg",
                isSelect: contraller.index == 7,
                press: () {
                  contraller.selectIndex(7);
                },
              ),
              // DrawerListTile(
              //   title: "Settings",
              //   svgSrc: "assets/icons/menu_setting.svg",
              //   isSelect: contraller.index == 7,
              //   press: () {
              //     contraller.selectIndex(7);
              //   },
              // ),
            ],
          );
        }),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {Key key,
      // For selecting those three line once press "Command+D"
      @required this.title,
      @required this.svgSrc,
      @required this.press,
      @required this.isSelect})
      : super(key: key);

  final String title;
  final String svgSrc;
  final VoidCallback press;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: isSelect ? Colors.blue : Colors.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: isSelect ? Colors.blue : Colors.white),
      ),
    );
  }
}
