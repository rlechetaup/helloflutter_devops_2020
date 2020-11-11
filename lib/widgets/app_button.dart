
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  Function onPressed;
  String text;

  AppButton(this.text,this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RaisedButton(
        key: Key(text),
        color: Colors.blue,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
