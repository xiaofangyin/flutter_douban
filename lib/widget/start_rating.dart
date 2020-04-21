import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyHomeContent extends StatefulWidget {
  final int totalCount;
  final double totalValues;
  final double curValues;
  final double size;

  MyHomeContent(
      {this.totalCount = 5,
        this.totalValues = 10,
        @required this.curValues,
        this.size = 30});

  @override
  _MyHomeContentState createState() => _MyHomeContentState();
}

class _MyHomeContentState extends State<MyHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnSelectedStarts(),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStarts(),
        ),
      ],
    );
  }

  List<Widget> buildUnSelectedStarts() {
    var start = Icon(
      Icons.star_border,
      size: widget.size,
      color: Colors.grey,
    );
    return List.generate(widget.totalCount, (index) {
      return start;
    });
  }

  List<Widget> buildSelectedStarts() {
    List<Widget> starts = [];
    var start = Icon(
      Icons.star,
      size: widget.size,
      color: Colors.orange,
    );

    double cellValues = widget.totalValues / widget.totalCount;
    int entireCount = (widget.curValues / cellValues).floor();
    List<Widget> entireList = List.generate(entireCount, (index) {
      return start;
    });

    double clipWidth = (widget.curValues - entireCount * cellValues) /
        cellValues *
        widget.size;
    final clipRect = ClipRect(
      clipper: MyCustomClipper(clipWidth),
      child: start,
    );
    starts.addAll(entireList);
    starts.add(clipRect);
    return starts;
  }
}

class MyCustomClipper extends CustomClipper<Rect> {
  double width;

  MyCustomClipper(this.width);

  @override
  getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyCustomClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}
