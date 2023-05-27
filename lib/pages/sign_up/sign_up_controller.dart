import 'dart:math';

import 'package:easylearning/common/widgets/widget_toast.dart';
import 'package:easylearning/pages/sign_up/bloc/sign_up_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpController {
  final BuildContext context;
  const SignUpController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<SignUpBlocs>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String repassword = state.rePassword;

    if (userName.isEmpty) {
      toastInfo(msg: "Username cannot be empty");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty");
      return;
    }
    if (password != repassword) {
      toastInfo(msg: "Your password confirmation is wrong");
      return;
    }

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        await credential.user?.sendEmailVerification();
        await credential.user?.updateDisplayName(userName);
        toastInfo(
            msg:
                "Verify your account by link in message  which sent to your email");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        toastInfo(msg: e.message.toString());
      } else if (e.code == "email-already-in-use") {
        toastInfo(msg: e.message.toString());
      } else if (e.code == "invalid-email") {
        toastInfo(msg: e.message.toString());
      }
    }
  }
}
