import 'package:admin/pages/responsive.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import 'widgets/header.dart';
import 'widgets/my_files.dart';
import 'widgets/recent_files.dart';
import 'widgets/storage_details.dart';

class DashboardScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: SingleChildScrollView(
      //   padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Header(
            title: 'Dashboard',
          ),
          SizedBox(height: defaultPadding * 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      // gas station info widget
                      child: MyFiles(title: 'Angelina Join File'),
                    ),
                    SizedBox(height: defaultPadding),
                    RecentFiles(title: "Recent Files"),
                    if (Responsive.isMobile(context))
                      SizedBox(height: defaultPadding),
                    if (Responsive.isMobile(context)) StorageDetails(),
                  ],
                ),
              ),

              if (!Responsive.isMobile(context))
                SizedBox(width: defaultPadding),
              // On Mobile means if the screen is less than 850 we dont want to show it
              if (!Responsive.isMobile(context))
                Expanded(
                  flex: 2,
                  child: StorageDetails(),
                ),
            ],
          )
        ],
      ),
      //  ),
    );
  }
}
