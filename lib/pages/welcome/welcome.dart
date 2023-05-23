import 'package:dots_indicator/dots_indicator.dart';
import 'package:easylearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:easylearning/pages/welcome/bloc/welcome_events.dart';
import 'package:easylearning/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBlocs, WelcomeState>(
          builder: (context, state) => Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    state.page = index;
                    BlocProvider.of<WelcomeBlocs>(context).add(WelcomeEvents());
                  },
                  children: [
                    _page(
                      1,
                      context,
                      "First see learning",
                      "Forget about bla bla bla ok and more bla bla bla",
                      "assets/images/reading.png",
                    ),
                    _page(
                      2,
                      context,
                      "Second string",
                      "Second substring",
                      "assets/images/boy.png",
                    ),
                    _page(
                      3,
                      context,
                      "Third string",
                      "Second substring",
                      "assets/images/man.png",
                      btnName: "lets get started",
                    ),
                  ],
                ),
                //! Dots indicator
                Positioned(
                  bottom: 100.h,
                  child: DotsIndicator(
                    position: state.page.toDouble(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: const DotsDecorator(
                      color: AppColors.primaryThreeElementText,
                      size: Size.square(7.0),
                      activeSize: Size(11, 11),
                      activeShape: CircleBorder(),
                      activeColor: AppColors.primaryElement,
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

  Widget _page(int index, BuildContext context, String title, String subTitle,
      String imagePath,
      {String btnName = "next"}) {
    return Column(
      children: [
        Column(
          children: [
            //! Image box
            SizedBox(
              width: 345.w,
              height: 345.w,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        //! First text box
        Container(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        //! Second text box
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        //! Button box
        GestureDetector(
          onTap: () {
            if (index < 3) {
              //animation
              _controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            } else {
              // Navigator.of(context).push(
              //   CupertinoPageRoute(
              //     builder: (context) => MyHomePage(title: "Test"),
              //   ),
              // );
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  spreadRadius: 8,
                  blurRadius: 12,
                  offset: const Offset(0, 1),
                )
              ],
            ),
            child: Center(
              child: Text(
                btnName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
