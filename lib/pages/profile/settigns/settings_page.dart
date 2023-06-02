import 'package:easylearning/common/routes/names.dart';
import 'package:easylearning/common/values/constants.dart';
import 'package:easylearning/global.dart';
import 'package:easylearning/pages/profile/settigns/widgets/settings_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/settings_page_blocs.dart';
import 'bloc/settings_page_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBlocs, SettingsStates>(
          builder: (context, state) {
            return Container(
                child: Column(
              children: [
                settingsButton(context),
              ],
            ));
          },
        ),
      ),
    );
  }
}
