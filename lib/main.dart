import 'package:easylearning/common/values/colors.dart';
import 'package:easylearning/pages/application/application_page.dart';
import 'package:easylearning/pages/bloc_providers.dart';
import 'package:easylearning/pages/sign_in/sign_in.dart';
import 'package:easylearning/pages/sign_up/sign_up.dart';
import 'package:easylearning/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const ApplicationPage(),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                iconTheme: IconThemeData(color: AppColors.primaryText)),
          ),
          routes: {
            "signIn": (context) => const SignIn(),
            "signUp": (context) => const SignUp(),
          },
        ),
      ),
    );
  }
}
