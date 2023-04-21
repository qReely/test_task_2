import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button(String title, BuildContext context, Function() onPressed) {
  return SizedBox(
    height: 64,
    width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width / 10,
    child: CupertinoButton(
      onPressed: onPressed,
      color: const Color.fromRGBO(19, 139, 0, 1),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w700),
      ),
    ),
  );
}
