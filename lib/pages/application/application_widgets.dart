// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

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

var bottomNavBarTabs = [
  BottomNavigationBarItem(
    label: "Home",
    icon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset("assets/icons/search2.png"),
    ),
    activeIcon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset(
        "assets/icons/search2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset("assets/icons/play-circle1.png"),
    ),
    activeIcon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset(
        "assets/icons/play-circle1.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset("assets/icons/message-circle.png"),
    ),
    activeIcon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset(
        "assets/icons/message-circle.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: "Search",
    icon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: SizedBox(
        width: 16.w,
        height: 16.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
    ),
    activeIcon: SizedBox(
      width: 16.w,
      height: 16.h,
      child: Image.asset(
        "assets/icons/person2.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
