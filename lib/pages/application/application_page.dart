// ignore_for_file: prefer_const_constructors
import 'package:easylearning/common/values/colors.dart';
import 'package:easylearning/pages/application/application_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: buildPage(_index),
          bottomNavigationBar: Container(
            width: 375.w,
            height: 58.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.h),
                topRight: Radius.circular(20.h),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: BottomNavigationBar(
              currentIndex: _index,
              onTap: (value) {
                setState(() {
                  _index = value;
                });
              },
              showSelectedLabels: false,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              //selectedItemColor: AppColors.primaryElement,
              //unselectedItemColor: AppColors.primaryFourElementText,
              items: [
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
