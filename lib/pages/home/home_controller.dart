import 'package:easylearning/common/entities/entities.dart';
import 'package:easylearning/global.dart';
import 'package:flutter/material.dart';

import '../../common/apis/course_api.dart';

class HomeController {
  final BuildContext context;
  final UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  Future<void> init() async {
    var result = await CourseAPI.courseList();
    if (result.code == 200) {
      print('OK');
      print(result.data![1].course_name);
    } else {
      print(result.code);
    }
  }
}
