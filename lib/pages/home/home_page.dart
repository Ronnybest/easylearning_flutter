import 'package:easylearning/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildText(
              text: "Hello,",
              color: AppColors.primaryThreeElementText,
              top: 20,
            ),
            buildText(
              text: "Zeppon",
              color: AppColors.primaryText,
              top: 5,
            ),
            SizedBox(
              height: 20.h,
            ),
            buildSearchView(),
          ],
        ),
      ),
    );
  }
}
