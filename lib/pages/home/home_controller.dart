import 'package:easylearning/common/entities/entities.dart';
import 'package:easylearning/global.dart';
import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;
  final UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});

  void init() {
    print("---home controller init method---");
  }
}
