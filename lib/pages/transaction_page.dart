import 'package:admin/pages/dashboard/widgets/my_files.dart';
import 'package:admin/pages/dashboard/widgets/recent_files.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      // height: 1000,
      // width: 1000,
      // color: Colors.blue,
      child: Column(
        children: <Widget>[
          MyFiles(title: 'Transaction'),
          SizedBox(height: defaultPadding),
          RecentFiles(
            title: "Recent Table Data",
          ),
        ],
      ),
    );
  }
}
