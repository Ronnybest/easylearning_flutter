import 'package:easylearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:easylearning/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:easylearning/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBlocs(),
        ),
        // BlocProvider(
        //   create: (context) => AppBlocs(),
        // ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => SignUpBlocs(),
        ),
      ];
}
