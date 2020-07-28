import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double sizeh = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Container(
          height: sizeh * 0.15,
          color: Colors.white,
        ),
        Container(
          height: sizeh * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: Colors.blue,
          ),
        ),
        Positioned(
          child: SvgPicture.asset(
            'assets/undraw_Note_list_re_r4u9.svg',
            width: sizeh * 0.14,
          ),
          right: 30,
          top: 0,
        ),
        Positioned(
          top: sizeh * 0.03,
          left: 30,
          child: Text(
            'ToDoList',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
