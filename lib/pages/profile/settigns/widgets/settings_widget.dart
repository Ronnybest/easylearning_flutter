import 'package:easylearning/pages/application/bloc/app_blocs.dart';
import 'package:easylearning/pages/application/bloc/app_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routes/names.dart';
import '../../../../common/values/constants.dart';
import '../../../../common/widgets/based_text_widget.dart';
import '../../../../global.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Container(
      child: Container(
        child: reusableMainText("Settings"),
      ),
    ),
  );
}

void removeUserData(BuildContext context) {
  context.read<AppBlocs>().add(const TriggerAppEvent(0));
  Global.storageService.removeFromKey(AppConstants.STORAGE_USER_TOKEN);
  Navigator.of(context)
      .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
}

Widget settingsButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Confirm log out"),
              content: const Text("Confirm log out"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => removeUserData(context),
                  child: const Text("Confirm"),
                ),
              ],
            );
          });
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage("assets/icons/Logout.png"),
        ),
      ),
    ),
  );
}
