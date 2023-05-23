import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../sign_in/bloc/sign_in_blocs.dart';
import '../sign_in/bloc/sign_in_events.dart';
import '../sign_in/bloc/sign_in_states.dart';
import '../sign_in/sign_in_controller.dart';
import '../sign_in/widgets/sign_in_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) => Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                      child: reusableText("Or use your email account to login"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(top: 36.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          buildTextField(
                              "Enter your email address",
                              TextInputType.emailAddress,
                              MdiIcons.account,
                              (value) => context
                                  .read<SignInBloc>()
                                  .add(EmailEvent(value))),
                          reusableText("Password"),
                          buildTextField(
                              "Enter your password",
                              TextInputType.visiblePassword,
                              MdiIcons.lock,
                              (value) => context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value))),
                          forgotPassword(),
                          buildLoginAndRegButton(
                            "Sign In",
                            () {
                              SignInController(context: context)
                                  .handleSignIn("email");
                            },
                          ),
                          buildLoginAndRegButton(
                            "Sign Up",
                            () {
                              Navigator.of(context).pushNamed("signUp");
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
