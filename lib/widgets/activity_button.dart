import 'package:flutter/material.dart';

class ActivityButton extends StatefulWidget {
  final IconData icon;
  final String text;
  bool selected;
  ActivityButton(
      {@required this.icon, @required this.text, this.selected = false});

  @override
  _ActivityButtonState createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Column(
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: new BoxDecoration(
              color: widget.selected ? Colors.green : Colors.black12,
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
              border: new Border.all(
                color: widget.selected ? Colors.greenAccent : Colors.black26,
                width: 4.0,
              ),
            ),
            child: Icon(widget.icon, color: Color.fromRGBO(53, 74, 95, 1)),
          ),
          Text(widget.text),
        ],
      ),
    );
  }
}
