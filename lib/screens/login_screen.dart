import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:outnet/app_res/AppStrings.dart';
import 'package:outnet/app_routes.dart';
import 'package:outnet/components/dialog_widget.dart';
import 'package:outnet/components/spin_widget.dart';
import 'package:outnet/connection.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../app_res/AppColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController myController = TextEditingController();
  late FocusNode focusNode;
  bool isVisibleSpin = true;
  bool dialogShown = false;

  @override
  void initState() {
    focusNode = FocusNode();
    connectToServer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          Center(
            child: buildWidgetCircularAnimator(),
          ),
          SpinWidget(isVisibleSpin: isVisibleSpin)
        ]),
      ),
      onWillPop: () async => false,
    );
  }

  void connectToServer() {
    Connection.connect(() {
      setState(() {
        if (dialogShown) {
          Navigator.of(context).pop(true);
        }
        dialogShown = false;
        isVisibleSpin = false;
        focusNode.requestFocus();
      });
    }, () {
      setState(() {
        if (!dialogShown) {
          showDialog();
          dialogShown = true;
        }
      });
    });
  }

  void showDialog() {
    AppDialog(
      message: AppStrings.lostConnection,
      title: AppStrings.error,
      buttons: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.orange),
            ),
            onPressed: () {
              connectToServer();
            },
            child: const Text(
              AppStrings.repeat,
              style: TextStyle(color: Colors.black),
            ))
      ],
    ).show(context);
  }

  WidgetCircularAnimator buildWidgetCircularAnimator() {
    return WidgetCircularAnimator(
      size: 300,
      innerIconsSize: 3,
      outerIconsSize: 3,
      innerAnimation: Curves.fastOutSlowIn,
      outerAnimation: Curves.fastOutSlowIn,
      innerColor: AppColors.orange,
      outerColor: AppColors.orange,
      innerAnimationSeconds: 10,
      outerAnimationSeconds: 10,
      reverse: true,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Center(
          child: buildTextField(),
        ),
      ),
    );
  }

  TextField buildTextField() {
    return TextField(
      onChanged: (text) {
        if (text.length == 4) {
          Navigator.popAndPushNamed(context, AppRoutes.chatScreen.name);
          if (kDebugMode) {
            print(text);
          }
        }
      },
      focusNode: focusNode,
      controller: myController,
      cursorColor: AppColors.orange,
      keyboardType: TextInputType.number,
      maxLength: 4,
      minLines: 1,
      maxLines: 1,
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 30, color: AppColors.orange),
      decoration: InputDecoration(
        hintText: AppStrings.enterCode,
        hintStyle: TextStyle(
          color: AppColors.orange.withOpacity(0.7),
        ),
        border: InputBorder.none,
      ),
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    myController.dispose();
    super.dispose();
  }
}
