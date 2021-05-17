import 'package:flutter/material.dart';

showMessageDialog(BuildContext context, String title, String subTitle) {
  showDialog(
      context: context,
      builder: (_) => Container(
        child: AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
          ),
          backgroundColor: Color(0xff36454f),
          title: Text(title, style: TextStyle(color: Colors.white70),),
          content: Text(subTitle, style: TextStyle(color: Colors.white70),),
          actions: <Widget>[
            MaterialButton(
              child: Text('Okay', style: TextStyle(color: Color(0xff355dee), fontWeight: FontWeight.bold),),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ));
}