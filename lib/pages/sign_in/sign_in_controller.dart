import 'package:easylearning/common/widgets/widget_toast.dart';
import 'package:easylearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {
          //!
          toastInfo(msg: "Please, enter email");
          return;
        } else {
          //toastInfo(msg: "Email is ${state.email}");
        }
        if (password.isEmpty) {
          //!
          toastInfo(msg: "Please, enter password");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //!
            print("User doesnt exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //!
            print("Email havent verified yet");
            return;
          }

          var user = credential.user;

          if (user != null) {
            print("User exist");
            // we got verified user from firebase
          } else {
            print("No user");
            return;
            // we have error getting user from firebase
          }
        } on FirebaseAuthException catch (e) {
          print('Failed with error code: ${e.code}');
          print(e.message);
          return;
          // if (e.code == "user-not-found") {
          //   print("No user found for this email");
          // } else if (e.code == "wrong-password") {
          //   print("Wrong password for this email");
        }
      }
    } catch (e) {}
  }
}
