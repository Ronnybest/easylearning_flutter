import 'package:easylearning/common/entities/entities.dart';
import 'package:easylearning/common/values/constants.dart';
import 'package:easylearning/global.dart';
import 'package:easylearning/pages/home/bloc/home_bloc.dart';
import 'package:easylearning/pages/home/bloc/home_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';

class HomeController {
  final BuildContext context;
  final UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    // make shure that user is log in and make api call
    if (Global.storageService
        .getStringFromKey(AppConstants.STORAGE_USER_TOKEN)
        .isNotEmpty) {
      var result = await CourseAPI.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomeBlocs>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.code);
      }
    }
  }
}
