import 'package:flutter/material.dart';

class SearchAnimation extends StatefulWidget {
  @override
  _SearchAnimationState createState() => _SearchAnimationState();
}

class _SearchAnimationState extends State<SearchAnimation>
    with SingleTickerProviderStateMixin {
  Widget _child;
  bool _showLine = true;
  AnimationController _animController;
  Animation _animation;
  double widthOfTextField = 300, sizeOfIcon = 45;

  @override
  void initState() {
    _animController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = Tween<double>(begin: sizeOfIcon, end: widthOfTextField)
        .animate(_animController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                _showLine = true;
              });
            }
          });
    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_showLine) {
              _animController.forward();
              _showLine = false;
            }
            _child = Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: TextField(
                    style: TextStyle(fontSize: 25),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search",
                        hintStyle: TextStyle(fontSize: 25),
                        contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        _child = Container();
                        _animController.reverse();
                      });
                    },
                  ),
                ),
              ],
            );
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(sizeOfIcon),
                    border: Border.all(color: Colors.black, width: 2)),
                height: sizeOfIcon,
                width: _animation.value,
                child: _child),
            CustomPaint(
              painter: MyPainter(_showLine),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final bool showLine;
  Paint _paint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  MyPainter(this.showLine);
  @override
  void paint(Canvas canvas, Size size) {
    if (showLine) {
      canvas.drawLine(Offset(15, -5), Offset(30, 10), _paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
