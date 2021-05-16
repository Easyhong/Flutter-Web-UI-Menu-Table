import 'package:admin/menu_change_notifier.dart';
import 'package:admin/pages/dashboard/dashboard_screen_page.dart';
import 'package:admin/pages/documents_page.dart';
import 'package:admin/pages/notification_page.dart';
import 'package:admin/pages/profile_page.dart';
import 'package:admin/pages/store_page.dart';
import 'package:admin/pages/task_page.dart';
import 'package:admin/pages/transaction_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'pages/control_panel_page.dart';

class MenuControllerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(defaultPadding),
        child:
            Consumer<MenuChangeNotifier>(builder: (context, controller, chile) {
          return IndexedStack(
            alignment: Alignment.topCenter,
            textDirection: TextDirection.ltr,
            sizing: StackFit.loose,
            index: controller.index,
            children: <Widget>[
              ControlPanelPage(),
              DashboardScreenPage(),
              TransactionPage(),
              TaskPage(),
              DocumentsPage(),
              StorePage(),
              NotificationPage(),
              ProfilePage(),
              // SettingPage(),
            ],
          );
        }),
      ),
    );
  }
}
