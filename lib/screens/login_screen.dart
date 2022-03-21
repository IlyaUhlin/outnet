import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';

import '../app_res/AppColors.dart';

// import 'package:think/app_resources/app_colors.dart';
// import 'package:think/chat_screen.dart';
// import 'package:widget_circular_animator/widget_circular_animator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: WidgetCircularAnimator(
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
                  child: TextField(
                    onChanged: (text) {
                      if (text.length == 4) {
                        if (kDebugMode) {
                          print(text);
                        }
                      }
                    },
                    autofocus: true,
                    controller: myController,
                    cursorColor: AppColors.orange,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    minLines: 1,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(fontSize: 30, color: AppColors.orange),
                    decoration: InputDecoration(
                      hintText: "Enter code",
                      hintStyle: TextStyle(
                        color: AppColors.orange.withOpacity(0.7),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
