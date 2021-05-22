import 'package:admin/models/today_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class MoneyInfoCardWidget extends StatelessWidget {
  const MoneyInfoCardWidget({
    Key key,
    @required this.info,
  }) : super(key: key);

  final TodayInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                info.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20, color: bgColor),
              ),
              SizedBox(height: 0),
              Text(
                "${info.money} ¥",
                style: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: Colors.greenAccent, fontSize: 28),
              ),
            ],
          ),
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: info.color.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              info.svgSrc,
              color: info.color,
              height: 80,
              width: 80,
            ),
          ),
        ],
      ),
    );
  }
}
