import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class TotalMoneyInfoWidget extends StatelessWidget {
  const TotalMoneyInfoWidget({
    Key key,
    @required this.info,
  }) : super(key: key);

  final TotalMoneyInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: info.color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              info.svgSrc,
              color: info.color,
            ),
          ),
          SizedBox(height: 6),
          Text(
            "${info.money} ¥",
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: bgColor, fontSize: 28),
          ),
          SizedBox(height: 6),
          Text(
            info.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, color: bgColor),
          ),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TotalItemWidget(
                  info: shopTotalList[0],
                ),
                TotalItemWidget(
                  info: shopTotalList[1],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class TotalListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Center(
//         child: ListView.builder(
//             // separatorBuilder: (context, position) {
//             //   return Container(
//             //     height: 0.5,
//             //     margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
//             //     color: Color.fromARGB(255, 234, 233, 234),
//             //   );
//             // },
//             itemCount: shopTotalList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return TotalItemWidget(
//                 info: shopTotalList[index],
//               );
//             }));
//   }
// }

class TotalItemWidget extends StatelessWidget {
  const TotalItemWidget({
    Key key,
    @required this.info,
  }) : super(key: key);

  final ShopTotal info;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: defaultPadding / 2),
      padding: EdgeInsets.all(defaultPadding / 2),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding / 2),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${info.shopName}',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: bgColor),
          ),
          Text(
            '${info.totalMoney}',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: bgColor),
          ),
        ],
      ),
    );
  }
}

// List totalMoneyList = [
//   {"shopName": "da hua shop-01", "totalMoney": "¥17392"},
//   {"shopName": "da hua shop-02", "totalMoney": "¥11332"},
//   {"shopName": "da hua shop-03", "totalMoney": "¥43233"},
//   {"shopName": "da hua shop-04", "totalMoney": "¥32224"},
// ];

class ShopTotal {
  final String shopName;
  final String totalMoney;

  ShopTotal({@required this.shopName, @required this.totalMoney});
}

List shopTotalList = [
  ShopTotal(shopName: "da hua shop-01", totalMoney: "¥17392"),
  ShopTotal(shopName: "da hua shop-02", totalMoney: "¥27392"),
  ShopTotal(shopName: "da hua shop-03", totalMoney: "¥37392"),
  ShopTotal(shopName: "da hua shop-04", totalMoney: "¥4392"),
];

class TotalMoneyInfo {
  final String svgSrc;
  final String title;
  final int money; // 金额
  final Color color;

  TotalMoneyInfo(
      {@required this.svgSrc,
      @required this.title,
      @required this.money,
      @required this.color});
}

List totalMoneyInfoData = [
  TotalMoneyInfo(
    title: "Total Income",
    money: 234561,
    svgSrc: "assets/icons/Documents.svg",
    color: Colors.white70,
  )
];
