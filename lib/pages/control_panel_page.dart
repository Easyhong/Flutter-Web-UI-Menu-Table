// 控制台
import 'package:admin/pages/responsive.dart';
import 'package:admin/widgets/bar_chart.dart';
import 'package:admin/widgets/gas_station_info_widget.dart';
import 'package:admin/widgets/money_info_card_gridview_widget.dart';
import 'package:admin/widgets/oli_info_card_gridview_widget.dart';
import 'package:admin/widgets/total_money_info_widget.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'dashboard/widgets/chart.dart';

class ControlPanelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    // TODO: implement build
    return Center(
      child: Column(
        children: <Widget>[
          // line 1
          Responsive(
            mobile: MoneyInfoCardGridViewWidget(
              crossAxisCount: _size.width < 650 ? 2 : 4,
              childAspectRatio: _size.width < 650 ? 1.3 : 1,
            ),
            tablet: MoneyInfoCardGridViewWidget(),
            // The ratio of the width to the height of the desktop.
            desktop: MoneyInfoCardGridViewWidget(
              childAspectRatio: _size.width < 1400 ? 1.0 : 2.0,
            ),
          ),

          SizedBox(height: defaultPadding / 2),
          // line 2
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // We want this side menu only for large screen
              if (Responsive.isDesktop(context))
                Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                    // gas station info widget
                    child: GasStationInfoWidget(title: 'Dahua Gas Station '),
                  ),
                ),

              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.red,
                  margin: EdgeInsets.fromLTRB(10, 0, 0, 10),
                  // padding: EdgeInsets.all(defaultPadding),
                  child: TotalMoneyInfoWidget(
                    info: totalMoneyInfoData[0],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: defaultPadding),

          // line 3
          Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: OliInfoCardGridViewWidget(
              title: 'Oli Type',
              crossAxisCount: 6,
              childAspectRatio: 1,
            ),
          ),

          SizedBox(height: defaultPadding),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (Responsive.isDesktop(context))
                Expanded(
                  // default flex = 1
                  flex: 3,
                  // and it takes 1/6 part of the screen
                  child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      // 柱状图表
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Chart Oli',
                            style: TextStyle(color: bgColor, fontSize: 18),
                          ),
                          BarChart(yValues: [
                            156,
                            124,
                            89,
                            87,
                            54,
                            122,
                            89,
                          ], xAxis: [
                            "02.01",
                            "02.02",
                            "02.03",
                            "02.04",
                            "02.05",
                            "02.06",
                            "02.07",
                          ]),
                        ],
                      )),
                ),
              SizedBox(width: defaultPadding),
              Expanded(
                // It takes 5/6 part of the screen
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Oli Charts",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: defaultPadding),
                      // 饼状图表
                      Chart(),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
