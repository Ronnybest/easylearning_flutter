// ignore_for_file: prefer_const_constructors
import 'package:easylearning/common/values/colors.dart';
import 'package:easylearning/pages/application/application_widgets.dart';
import 'package:easylearning/pages/application/bloc/app_blocs.dart';
import 'package:easylearning/pages/application/bloc/app_events.dart';
import 'package:easylearning/pages/application/bloc/app_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBlocs, AppStates>(
      builder: (context, state) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            body: buildPage(state.index),
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
                currentIndex: state.index,
                onTap: (value) {
                  context.read<AppBlocs>().add(TriggerAppEvent(value));
                },
                showSelectedLabels: false,
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                //selectedItemColor: AppColors.primaryElement,
                //unselectedItemColor: AppColors.primaryFourElementText,
                items: bottomNavBarTabs,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
