import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// !REGISTRATION
import '../common_widgets.dart';
import '../sign_in/bloc/sign_in_blocs.dart';
import '../sign_in/bloc/sign_in_events.dart';
import '../sign_in/bloc/sign_in_states.dart';

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
              appBar: buildAppBar(text: "Sign Up"),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //buildThirdPartyLogin(context),
                    SizedBox(
                      height: 34.h,
                    ),
                    Center(
                      child: reusableText("Create your account now!"),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25.w, right: 25.w),
                      margin: EdgeInsets.only(top: 36.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Username"),
                          buildTextField(
                            "Enter your username",
                            TextInputType.name,
                            MdiIcons.account,
                            (value) => context.read<SignInBloc>().add(
                                  EmailEvent(value),
                                ),
                          ),
                          reusableText("Email"),
                          buildTextField(
                            "Enter your email address",
                            TextInputType.emailAddress,
                            MdiIcons.email,
                            (value) => context.read<SignInBloc>().add(
                                  EmailEvent(value),
                                ),
                          ),
                          reusableText("Password"),
                          buildTextField(
                            "Enter your password",
                            TextInputType.visiblePassword,
                            MdiIcons.lock,
                            (value) => context.read<SignInBloc>().add(
                                  PasswordEvent(value),
                                ),
                          ),
                          reusableText("Confirm password"),
                          buildTextField(
                            "Confirm",
                            TextInputType.visiblePassword,
                            MdiIcons.lock,
                            (value) => context.read<SignInBloc>().add(
                                  PasswordEvent(value),
                                ),
                          ),
                          buildLoginAndRegButton(
                            "Sign Up",
                            "Sign In",
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
