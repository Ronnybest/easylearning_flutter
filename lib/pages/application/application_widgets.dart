// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

Widget buildPage(int index) {
  List<Widget> _widgets = [
    Center(child: Text("Hello")),
    Center(child: Text("Search")),
    Center(child: Text("Courses")),
    Center(child: Text("Chat")),
    Center(child: Text("Profile")),
  ];

  return _widgets[index];
}
