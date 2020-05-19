import 'package:flutter/material.dart';

class ActivityButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;
  final Function onPressed;

  const ActivityButton(
      {@required this.icon,
      @required this.text,
      @required this.selected,
      @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Container(
            width: 90,
            height: 90,
            decoration: new BoxDecoration(
              color: selected ? Colors.green : Colors.black12,
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: selected ? Colors.greenAccent : Colors.black26,
                width: 4.0,
              ),
            ),
            child: LayoutBuilder(builder: (context, constraint) {
              return Icon(icon,
                  color: Color.fromRGBO(53, 74, 95, 1),
                  size: constraint.biggest.height / 2);
            }),
          ),
          Text(text),
        ],
      ),
    );
  }
}
