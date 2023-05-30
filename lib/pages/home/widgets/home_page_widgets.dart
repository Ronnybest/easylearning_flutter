import 'package:dots_indicator/dots_indicator.dart';
import 'package:easylearning/common/values/colors.dart';
import 'package:easylearning/pages/home/bloc/home_bloc.dart';
import 'package:easylearning/pages/home/bloc/home_events.dart';
import 'package:easylearning/pages/home/bloc/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset("assets/icons/menu.png"),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/icons/person.png"),
              )),
            ),
          ),
        ],
      ),
    ),
  );
}

// reusable text widget
Widget buildText(
    {required String text, required Color color, required double top}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Container(
    child: Row(children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(color: AppColors.primaryFourElementText),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.h),
              width: 16.w,
              height: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            Container(
              width: 245.w,
              height: 35.h,
              //color: Colors.red.withOpacity(.5),
              child: TextField(
                //textAlignVertical: TextAlignVertical.bottom,
                keyboardType: TextInputType.multiline,
                autocorrect: false,
                obscureText: false,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 5),
                  hintText: "search courses...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                ),
                style: TextStyle(
                  color: AppColors.primaryText,
                  fontFamily: "Avenir",
                  fontWeight: FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      ),
    ]),
  );
}

// widget for sliders
Widget slidersView(BuildContext context, HomeStates state) {
  List<String> itemsPath = [
    "assets/icons/Art.png",
    "assets/icons/Image(1).png",
    "assets/icons/Image(2).png"
  ];
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView.builder(
          onPageChanged: (value) {
            context.read<HomeBlocs>().add(HomeDots(value));
          },
          itemCount: itemsPath.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(left: 5.w),
            width: 325.w,
            height: 160.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.h)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(itemsPath[index]),
              ),
            ),
          ),
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: itemsPath.length,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryThreeElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5),
            activeSize: const Size(17, 5),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    ],
  );
}
