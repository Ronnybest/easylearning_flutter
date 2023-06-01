import 'package:easylearning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildProfileAppbar() {
  return AppBar(
    title: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 18.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          Text(
            "Profile",
            style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset("assets/icons/more-vertical.png"),
          ),
        ],
      ),
    ),
  );
}

//profile icon
Widget profileAndEditIcon() {
  return Container(
    alignment: Alignment.bottomRight,
    padding: EdgeInsets.only(
      right: 6.w,
    ),
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.w),
      image: DecorationImage(
        image: AssetImage("assets/icons/headpic.png"),
      ),
    ),
    child: Image(
      image: AssetImage("assets/icons/edit_3.png"),
      width: 25.w,
      height: 25.h,
    ),
  );
}
