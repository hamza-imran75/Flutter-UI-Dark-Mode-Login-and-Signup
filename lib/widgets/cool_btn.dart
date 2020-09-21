import 'package:flutter/material.dart';

class CoolBtn extends StatelessWidget {
  const CoolBtn({
    Key key,
    this.text,
    @required this.scrSize,
  }) : super(key: key);

  final Size scrSize;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scrSize.width * 0.5,
      height: 50,
      child: FlatButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90)),
        color: Color(0xff08f0e0),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20, color: Color(0xff181830)),
        ),
      ),
    );
  }
}
