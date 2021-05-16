import 'package:flutter/material.dart';

import 'char_painter.dart';

class BarChart extends StatefulWidget {
  final List<double> yValues;
  final List<String> xAxis;

  const BarChart({
    this.yValues,
    this.xAxis,
  });

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> with TickerProviderStateMixin {
  AnimationController _controller;
  final _animations = <double>[];

  @override
  void initState() {
    super.initState();

    double begin = 0.0;

    List<double> yValues = widget.yValues;
    // 初始化动画控制器，并调用 forward 方法启动动画
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    )..forward();

    // 遍历当前图标元素的个数
    for (int i = 0; i < yValues.length; i++) {
      final double end = yValues[i];
      // 使用一个补间值 Tween 创建每个矩形的动画值
      final Tween<double> tween = Tween(begin: begin, end: end);
      // 初始化数组里面的值
      _animations.add(begin);

      // 创建补间动画
      Animation<double> animation = tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.ease,
        ),
      );
      _controller.addListener(() {
        // 使用 setState 更新 _animations 数组里面的动画值
        setState(() {
          _animations[i] = animation.value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 10, 20),
      width: 880,
      height: 240,
      child: CustomPaint(
        painter: ChartPainter(
          // 最后向 ColumnChartPainter 传入 _animations 数组
          yValues: _animations,
          xAxis: widget.xAxis,
          animation: _controller,
        ),
      ),
    );
  }
}
