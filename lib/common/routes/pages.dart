import 'package:easylearning/common/routes/names.dart';
import 'package:easylearning/pages/application/application_page.dart';
import 'package:easylearning/pages/application/bloc/app_blocs.dart';
import 'package:easylearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:easylearning/pages/sign_in/sign_in.dart';
import 'package:easylearning/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:easylearning/pages/sign_up/sign_up.dart';
import 'package:easylearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:easylearning/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//unify bloc provider, routers and pages

class AppPages {
  static List<PageEntity> Routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBlocs()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SignInBlocs()),
      ),
      PageEntity(
        route: AppRoutes.SIGN_UP,
        page: const SignUp(),
        bloc: BlocProvider(create: (_) => SignUpBlocs()),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBlocs()),
      ),
    ];
  }

  //return all bloc providers
  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in Routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  // a modal that covers entire screen when we click on Navigator object
  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered
      var result = Routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        //print("Valid route ${settings.name}");
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }
    //print("Invalid route ${settings.name}");
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
