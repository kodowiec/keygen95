import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Win95WindowFrame extends StatefulWidget {
  final String title;
  final double minWidth;
  final double maxWidth;
  final double margin;
  final Widget child;
  final EdgeInsetsGeometry padding;

  Win95WindowFrame({
    Key key,
    @required this.title,
    @required this.child,
    this.minWidth: 60.0,
    this.margin: 4.0,
    this.maxWidth: double.infinity,
    this.padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
  }) : super(key: key);

  @override
  _Win95WindowFrameState createState() => _Win95WindowFrameState();
}

class Win95WhiteFrame extends StatefulWidget {
  final double minWidth;
  final double margin;
  final Widget child;

  Win95WhiteFrame({
    Key key,
    this.minWidth: 60.0,
    this.margin: 4.0,
    @required this.child,
  }) : super (key: key);
  
@override 
_Win95WhiteFrameState createState() => _Win95WhiteFrameState();
}

class _Win95WhiteFrameState extends State<Win95WhiteFrame> {
  static const _backgroundColor = const Color(0xFFFFFFFF);
  static const _borderWidth = 2.0;
  static const _whiteSide =
      const BorderSide(color: Color(0xFFFFF8FF), width: _borderWidth);
  static const _lightGraySide =
      const BorderSide(color: Color(0xFFdfd8df), width: _borderWidth);
  static const _darkGraySide =
      const BorderSide(color: Color(0xFF7f787f), width: _borderWidth);
  static const _blackSide =
      const BorderSide(color: Colors.black, width: _borderWidth);

  static const _outerDecoration = BoxDecoration(
    border: Border(
        top: _blackSide,
        left: _blackSide,
        right: _whiteSide,
        bottom: _whiteSide),
  );

  static const _innerDecoration = BoxDecoration(
    color: _backgroundColor,
    border: Border(
        right: _lightGraySide,
        bottom: _lightGraySide,
        top: _darkGraySide,
        left: _darkGraySide),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.margin),
      child: Container(
        decoration: _outerDecoration,
        child: Container(
          decoration: _innerDecoration,
          child: _buildContents(),
        ),
      ),
    );
  }

  Padding _buildContents() {
    return Padding(
      //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: widget.minWidth),
        child: 
            Expanded(
                flex: 0,
                child: Container(
                  //padding: const EdgeInsets.symmetric(orizontal: 4.0, vertical: 4.0),
                  child: widget.child,
                ))
        ),
    );
  }
}

class _Win95WindowFrameState extends State<Win95WindowFrame> {
  static const _backgroundColor = const Color(0xFFbfb8bf);

  static const _borderWidth = 2.0;
  static const _whiteSide =
      const BorderSide(color: Color(0xFFFFF8FF), width: _borderWidth);
  static const _lightGraySide =
      const BorderSide(color: Color(0xFFdfd8df), width: _borderWidth);
  static const _darkGraySide =
      const BorderSide(color: Color(0xFF7f787f), width: _borderWidth);
  static const _blackSide =
      const BorderSide(color: Colors.black, width: _borderWidth);

  static const _outerDecoration = BoxDecoration(
    border: Border(
        top: _whiteSide,
        left: _whiteSide,
        right: _blackSide,
        bottom: _blackSide),
  );

  static const _innerDecoration = BoxDecoration(
    color: _backgroundColor,
    border: Border(
        top: _lightGraySide,
        left: _lightGraySide,
        right: _darkGraySide,
        bottom: _darkGraySide),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.margin),
      child: Container(
        decoration: _outerDecoration,
        child: Container(
          decoration: _innerDecoration,
          child: _buildContents(),
        ),
      ),
    );
  }

  Padding _buildContents() {
    return Padding(
      //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: widget.minWidth, maxWidth: widget.maxWidth),
        child: Column(
          children: [
            Expanded(
              flex: 0,
              child: Container(
                constraints: BoxConstraints(minWidth: double.infinity),
                color: Color.fromARGB(255, 42, 0, 124),
                child: Text('  ' + widget.title + '  ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29.0,
                      fontFamily: 'RedAlert',
                    )),
              ),
            ),
            Expanded(
                flex: 0,
                child: Container(
                  padding: widget.padding,
                  color: Color(0xFFbfb8bf),
                  child: widget.child,
                ))
          ],
        ),
      ),
    );
  }
}
