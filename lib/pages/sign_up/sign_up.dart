import 'package:easylearning/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:easylearning/pages/sign_up/bloc/sign_up_events.dart';
import 'package:easylearning/pages/sign_up/bloc/sign_up_states.dart';
import 'package:easylearning/pages/sign_up/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// !REGISTRATION
import '../common_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBlocs, SignUpStates>(
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
                            (value) => context.read<SignUpBlocs>().add(
                                  UserNameEvent(value),
                                ),
                          ),
                          reusableText("Email"),
                          buildTextField(
                            "Enter your email address",
                            TextInputType.emailAddress,
                            MdiIcons.email,
                            (value) => context.read<SignUpBlocs>().add(
                                  EmailEvent(value),
                                ),
                          ),
                          reusableText("Password"),
                          buildTextField(
                            "Enter your password",
                            TextInputType.visiblePassword,
                            MdiIcons.lock,
                            (value) => context.read<SignUpBlocs>().add(
                                  PasswordEvent(value),
                                ),
                          ),
                          reusableText("Confirm password"),
                          buildTextField(
                            "Confirm",
                            TextInputType.visiblePassword,
                            MdiIcons.lock,
                            (value) => context.read<SignUpBlocs>().add(
                                  RePasswordEvent(value),
                                ),
                          ),
                          buildLoginAndRegButton(
                            "Sign Up",
                            "Sign In",
                            () {
                              //Navigator.of(context).pushNamed("signUp");
                              SignUpController(context: context)
                                  .handleEmailRegister();
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
