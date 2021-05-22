import 'package:admin/models/my_files.dart';
import 'package:admin/pages/dashboard/widgets/file_info_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class OliInfoCardGridViewWidget extends StatelessWidget {
  const OliInfoCardGridViewWidget({
    // Parameters with default values are not required.
    this.crossAxisCount = 6,
    this.childAspectRatio = 1,
    @required this.title,
    Key key,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(color: bgColor, fontSize: 18),
        ),
        SizedBox(height: defaultPadding),
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: oliInfoData.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) =>
              FileInfoCard(info: oliInfoData[index]),
        ),
      ],
    );
  }
}
