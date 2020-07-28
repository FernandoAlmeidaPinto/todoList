import 'package:flutter/material.dart';

class DismissibleCard extends StatelessWidget {
  final String title;
  final Color color;
  final Function delete;

  DismissibleCard({
    @required this.title,
    this.color = Colors.blue,
    @required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    double sizeh = MediaQuery.of(context).size.height;
    return Dismissible(
      onDismissed: (DismissDirection direction) => {
        delete(title)
      },
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(10),
        color: Colors.green,
        child: Icon(
          Icons.check_box,
          color: Colors.white,
          size: 30,
        ),
      ),
      secondaryBackground: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        color: Colors.red,
        child: Icon(
          Icons.cancel,
          color: Colors.white,
          size: 30,
        ),
      ),
      key: UniqueKey(),
      child: Container(
        height: sizeh * 0.07,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
