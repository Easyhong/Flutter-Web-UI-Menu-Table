import 'package:flutter/material.dart';

import '../constants.dart';

class ChartPainter extends CustomPainter {
  final List<double> yValues;
  final List<String> xAxis;
  final Animation<double> animation;

  ChartPainter({
    this.yValues,
    this.xAxis,
    this.animation,
  }) : super(repaint: animation);

  // 绘制坐标轴
  void _drawAxis(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // 使用 Paint 定义路径的样式
    final Paint _paint = Paint()
      ..color = Colors.white70
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..isAntiAlias = true;

    // 画笔颜色
    // ..strokeCap = StrokeCap.round // 画笔笔头类型\
    // ..isAntiAlias = true //是否开启抗锯齿
    // ..blendMode = BlendMode.src//颜色混合模式
    // ..style = PaintingStyle.stroke // 画笔样式，默认为填充
    // ..colorFilter = ColorFilter.mode(Colors.blueAccent,BlendMode.src) //颜色渲染模式
    // ..maskFilter = MaskFilter.blur(BlurStyle.inner, 3.0) //模糊遮罩效果
    // ..filterQuality = FilterQuality.high //颜色渲染模式的质量
    //画笔的宽度

    // 使用 Path 定义绘制的路径，从画布的左上角到左下角在到右下角
    // 带箭头路径
    final Path _path = Path()
      ..moveTo(0.0, 0.0)
      ..lineTo(-3.0, 3.0)
      ..lineTo(0.0, 0.0)
      ..lineTo(3.0, 3.0)
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, height)
      ..lineTo(width, height)
      ..lineTo(width - 3, height - 3)
      ..lineTo(width, height)
      ..lineTo(width - 3, height + 3);

    // 使用 drawPath 方法绘制路径
    canvas.drawPath(_path, _paint);
  }

  void _drawLabels(Canvas canvas, Size size) {
    // y轴坐标间隔
    final double yGap = 30.0;
    final double height = size.height;
    final List<double> yAxisLabels = [];
    final double labelFontSize = 14.0;

    Paint paint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 2.0;

    // 使用 50.0 为间隔绘制比传入数据多一个的标识
    for (int i = 0; i <= yValues.length; i++) {
      yAxisLabels.add(yGap * i);
    }

    yAxisLabels.asMap().forEach(
      (index, label) {
        // 标识的高度为画布高度减去标识的值
        final double top = height - label;
        final rect = Rect.fromLTWH(0, top, 4, 0.5);
        // 纵坐标标尺label 偏移位置
        final Offset textOffset = Offset(
          0 - labelFontSize * 2,
          top - labelFontSize / 2,
        );

        // 绘制 Y 轴右边的线条
        canvas.drawRect(rect, paint);

        // 绘制文字需要用 `TextPainter`，最后调用 paint 方法绘制文字
        TextPainter(
          text: TextSpan(
            text: label.toStringAsFixed(0),
            style: TextStyle(fontSize: labelFontSize, color: Colors.white70),
          ),
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          textWidthBasis: TextWidthBasis.longestLine,
        )
          ..layout(minWidth: 0, maxWidth: 40)
          ..paint(canvas, textOffset);
      },
    );
  }

  void _darwBars(Canvas canvas, Size size) {
    // 控件高度
    final height = size.height;
    final paint = Paint()..style = PaintingStyle.fill;
    // 矩形宽度
    final double _barWidth = 20;
    // 矩形之间的间距
    final double _barGap = 100;

    final double textFontSize = 14.0;

    // 遍历矩形的个数
    for (int i = 0; i < yValues.length; i++) {
      // 每个矩形使用预设的 colors 数组里面的颜色
      paint.color = colors[i];
      // 矩形高度
      final double yValueHeight = yValues[i];
      // 矩形的上边缘为画布高度减去数据值
      final double top = height - yValueHeight;
      // 矩形的左边距离 = 间距 + i * 矩形宽度 + 间距 * i
      final double left = _barGap + i * _barWidth + i * _barGap;

      // 使用 Rect.fromLTWH 方法创建要绘制的矩形
      final rect = Rect.fromLTWH(left, top, _barWidth, yValueHeight);
      // 使用 drawRect 方法绘制矩形
      // canvas.drawRect(rect, paint);

      final _rrect = RRect.fromLTRBAndCorners(
          left, height - yValueHeight, left + _barWidth, height,
          topLeft: Radius.circular(6.0),
          topRight: Radius.circular(6.0),
          bottomRight: Radius.circular(0.0),
          bottomLeft: Radius.circular(0.0));

      canvas.drawRRect(_rrect, paint);

      final offset = Offset(
        left + _barWidth / 2 - textFontSize * 1.2,
        top - textFontSize * 2,
      );
      // 使用 TextPainter 绘制矩形上放的数值
      TextPainter(
        text: TextSpan(
          text: yValueHeight.toStringAsFixed(1),
          style: TextStyle(fontSize: textFontSize, color: paint.color),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )
        ..layout(
          minWidth: 0,
          maxWidth: textFontSize * yValueHeight.toString().length,
        )
        ..paint(canvas, offset);

      final xData = xAxis[i];
      final xOffset = Offset(left + _barWidth / 2 - textFontSize, height + 12);
      // 绘制横轴标识
      TextPainter(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$xData',
          style: TextStyle(fontSize: 12, color: Colors.white70),
        ),
        textDirection: TextDirection.ltr,
      )
        ..layout(
          minWidth: 0,
          maxWidth: size.width,
        )
        ..paint(canvas, xOffset);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: 绘制坐标轴
    _drawAxis(canvas, size);
    _drawLabels(canvas, size);
    _darwBars(canvas, size);
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(ChartPainter oldDelegate) => false;
}
