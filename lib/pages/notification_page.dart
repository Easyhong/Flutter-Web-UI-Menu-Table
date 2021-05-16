import 'package:flutter/material.dart';

import 'dashboard/widgets/recent_files.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      // height: 1000,
      // width: 1000,
      // color: Colors.white,
      // child: Text('Documents page',
      //     style: TextStyle(fontSize: 20, color: Colors.red)),

      child: RecentFiles(
        title: "Recent Table Data",
      ),
    );
  }
}
