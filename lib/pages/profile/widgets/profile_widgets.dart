import 'package:easylearning/common/routes/names.dart';
import 'package:easylearning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/based_text_widget.dart';

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
          reusableMainText("Profile"),
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

//settings sections buttons

List<IconData> iconList = [
  Icons.settings_suggest,
  Icons.payment,
  Icons.workspace_premium,
  Icons.favorite,
  Icons.fact_check,
];

List<String> settingsTitle = [
  "Settings",
  "Payment details",
  "Achievements",
  "Favourite",
  "Learning reminders",
];

List<String> settingsSubTitle = [
  "Account's settings and more",
  "Edit payment methods",
  "Your own goals",
  "List of favourites courses",
  "Dont't forget to learn",
];

Widget buildItemsListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(iconList.length, (index) {
        return GestureDetector(
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoutes.PROFILE_SETTINGS_PAGE),
          child: Container(
            //color: Colors.red,
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              children: [
                Icon(
                  iconList[index],
                  color: AppColors.primaryText,
                  size: 32,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      settingsTitle[index],
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp),
                    ),
                    Text(
                      settingsSubTitle[index],
                      style: TextStyle(
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    ],
  );
}
