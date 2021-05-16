import 'package:admin/models/today_data.dart';
import 'package:admin/widgets/money_info_card_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

// Console line 1 widget
class MoneyInfoCardGridViewWidget extends StatelessWidget {
  const MoneyInfoCardGridViewWidget({
    // Parameters with default values are not required.
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    Key key,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: todayInfoData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) =>
          MoneyInfoCardWidget(info: todayInfoData[index]),
    );
  }
}
