import 'dart:convert';

import 'package:easylearning/common/entities/entities.dart';
import 'package:easylearning/common/values/constants.dart';
import 'package:easylearning/common/widgets/widget_toast.dart';
import 'package:easylearning/global.dart';
import 'package:easylearning/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../common/apis/user_api.dart';

class SignInController {
  final BuildContext context;
  const SignInController({required this.context});

  void handleSignIn(String type) async {
    try {
      if (type == "email") {
        //BlocProvider.of<SignInBloc>(context).state;
        final state = context.read<SignInBlocs>().state;
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
            //print("User doesnt exist");
            return;
          }
          if (!credential.user!.emailVerified) {
            //!
            //print("Email havent verified yet");
            return;
          }

          var user = credential.user;

          if (user != null) {
            String? displayName = user.displayName;
            String? email = user.email;
            String? id = user.uid;
            String? photoUrl = user.photoURL;
            print(
                "PHOTO URL $photoUrl , email $email , id $id , display name $displayName ");
            LoginRequestEntity loginRequestEntity = LoginRequestEntity(
              avatar: photoUrl,
              name: displayName,
              email: email,
              open_id: id,
              type: 1, //type 1 means email login
            );
            asycnPostAllData(loginRequestEntity);
            //print("User exist");

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

  void asycnPostAllData(LoginRequestEntity loginRequestEntity) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    var result = await UserAPI.login(params: loginRequestEntity);
    if (result.code == 200) {
      try {
        Global.storageService.setStringToKey(
            AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data!));
        // used for auth that's why we save it
        Global.storageService.setStringToKey(
            AppConstants.STORAGE_USER_TOKEN, result.data!.access_token!);
        print(result!.data!.access_token!);
        EasyLoading.dismiss();
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/application", (route) => false);
      } catch (e) {
        print("Saving to local storage error ${e.toString()}");
      }
    } else {
      EasyLoading.dismiss();
      toastInfo(msg: "Error during login");
    }
  }
}
