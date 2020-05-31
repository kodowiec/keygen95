import 'dart:math';

import 'package:flutter/material.dart';

import 'dart:ui';

import 'win95.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'keygen95',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'keygen95'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class Win95Button extends StatefulWidget {
  final String text;

  final double minWidth;

  final double margin;

  final VoidCallback onTap;

  Win95Button({
    Key key,
    @required this.text,
    this.minWidth: 60.0,
    this.margin: 4.0,
    this.onTap,
  }) : super(key: key);

  @override
  _Win95ButtonState createState() => _Win95ButtonState();
}

String _key = "";

num _fontSize = 25.0;

class _MyHomePageState extends State<MyHomePage> {
  static final _winFontStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'RedAlert',
    fontSize: 18.0,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 129, 130),
      appBar: null,
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            //grey Color(0xFFbfb8bf),
            //win95titlecolor Color.fromARGB(255, 42, 0, 124),
            //win95defaultbackgroundColor: const Color.fromARGB(255, 0, 129, 130),
            Text('\nkeygen95',
                style:
                    _winFontStyle.copyWith(color: Colors.white, fontSize: 50)),
            Text(''),
            new Win95WindowFrame(
              title: 'Microsoft \'95 keygen',
              maxWidth: 350,
              child: new Column(children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Win95Button(text: "10-digit CD keys", onTap: _cdk),
                    Win95Button(text: "OEM keys", onTap: _oem),
                  ],
                ),
                new Win95WhiteFrame(
                  minWidth: double.infinity,
                  child: new Text('$_key',
                      style: _winFontStyle.copyWith(fontSize: _fontSize)),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  int _random(int min, int max) {
    Random random = new Random();
    return min + random.nextInt(max - min);
  }

  String _gen7() {
    int randnumb = _random(0, 9999999);
    List<String> blockedEnd = ["0", "8", "9"];
    int _temp = 0;
    while (blockedEnd.contains(
        randnumb.toString().substring(randnumb.toString().length - 1))) {
      randnumb = _random(0, 9999999);
    }
    int randCopy = randnumb;
    while (randnumb != 0) {
      _temp += randnumb % 10;
      randnumb = (randnumb ~/ 10);
    }
    if (_temp % 7 == 0) {
      return randCopy.toString().padLeft(7, "0");
    } else
      return null;
  }

  //OEM keys
  _oem() {
    _key = "";
    for (int i = 0; i < 10; i++) {
      int date = _random(1, 366);
      List<String> years = ["00", "01", "03", "95", "96", "97", "98", "99"];
      String year = years[_random(0, years.length - 1)];
      String mid = _gen7.call();
      while (mid == null) {
        mid = _gen7.call();
      }
      String generatedKey = date.toString().padLeft(3, "0") +
          year +
          "-OEM-" +
          mid +
          "-" +
          _random(0, 99999).toString().padLeft(5, "0");
      setState(() {
        if (i == 9)
          _key += ' ' + generatedKey + ' ';
        else
          _key += ' ' + generatedKey + ' \n';
      });
    }
  }

// 10-digit CD keys
  _cdk() {
    _key = "";
    for (int i = 0; i < 10; i++) {
      List<int> blocked3 = [333, 444, 555, 666, 777, 888, 999];
      int firstThree = _random(0, 999);
      while (blocked3.contains(firstThree)) {
        firstThree = _random(0, 999);
      }
      String _three = firstThree.toString().padLeft(3, "0");
      String last = _gen7.call();
      while (last == null) {
        last = _gen7.call();
      }
      //print(_three + "-" + last);
      String generatedKey = _three + "-" + last;
      setState(() {
        if (i == 9)
          _key += ' ' + generatedKey + ' ';
        else
          _key += ' ' + generatedKey + ' \n';
      });
    }
  }
}

// win95 button
class _Win95ButtonState extends State<Win95Button> {
  static const _backgroundColor = const Color(0xFFbfb8bf);

  static const _borderWidth = 1.0;
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

  static const _outerDecorationPressed = BoxDecoration(
    border: Border(
        top: _blackSide,
        left: _blackSide,
        right: _whiteSide,
        bottom: _whiteSide),
  );

  static const _innerDecoration = BoxDecoration(
    color: _backgroundColor,
    border: Border(
        top: _lightGraySide,
        left: _lightGraySide,
        right: _darkGraySide,
        bottom: _darkGraySide),
  );

  static const _innerDecorationPressed = BoxDecoration(
    color: _backgroundColor,
    border: Border(
        top: _darkGraySide,
        left: _darkGraySide,
        right: _lightGraySide,
        bottom: _lightGraySide),
  );

  bool _pressed = false;

  bool get isDisabled => widget.onTap == null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.margin),
      child: Container(
        decoration: _pressed ? _outerDecorationPressed : _outerDecoration,
        child: Container(
          decoration: _pressed ? _innerDecorationPressed : _innerDecoration,
          child: GestureDetector(
            onTapDown: isDisabled ? null : _onTapDown,
            onTapCancel: isDisabled ? null : _onTapCancel,
            onTapUp: isDisabled ? null : _onTapUp,
            child: _buildContents(),
          ),
        ),
      ),
    );
  }

  Padding _buildContents() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: widget.minWidth),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: _fontSize,
            fontFamily: 'RedAlert',
          ),
        ),
      ),
    );
  }

  void _onTapCancel() {
    setState(() {
      _pressed = false;
    });
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _pressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _pressed = false;
    });

    widget.onTap();
  }
}
