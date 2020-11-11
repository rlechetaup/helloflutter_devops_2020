
import 'package:flutter/material.dart';

Future alert(
    BuildContext context,
    String msg, {
      String title,
      Function callback,
    }) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: title != null ? Text(title, key: Key('dialogTitle')) : null,
          content: Text(msg, key: Key('dialogMsg')),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "OK",
                key: Key('dialogOk'),
              ),
              onPressed: () {
                Navigator.pop(context);
                if (callback != null) {
                  callback();
                }
              },
            )
          ],
        ),
      );
    },
  );
}