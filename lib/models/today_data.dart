import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class TodayInfo {
  final String svgSrc;
  final String title;
  final int money; // 金额
  final Color color;

  TodayInfo(
      {@required this.svgSrc,
      @required this.title,
      @required this.money,
      @required this.color});
}

List todayInfoData = [
  TodayInfo(
    title: "Today Income",
    money: 12000,
    svgSrc: "assets/icons/Documents.svg",
    color: primaryColor,
  ),
  TodayInfo(
    title: "Today the Charge",
    money: 12000,
    svgSrc: "assets/icons/google_drive.svg",
    color: Color(0xFFFFA113),
  ),
  TodayInfo(
    title: "Today Recharge",
    money: 200000,
    svgSrc: "assets/icons/one_drive.svg",
    color: Color(0xFFA4CDFF),
  ),
  TodayInfo(
    title: "Add Member",
    money: 5328,
    svgSrc: "assets/icons/drop_box.svg",
    color: Color(0xFF007EE5),
  ),
];
