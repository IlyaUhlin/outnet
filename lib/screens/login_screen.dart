import 'package:flutter/material.dart';

// import 'package:think/app_resources/app_colors.dart';
// import 'package:think/chat_screen.dart';
// import 'package:widget_circular_animator/widget_circular_animator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Text(
            "App routes",
            style: TextStyle(color: Colors.white),
          ),
          // child: WidgetCircularAnimator(
          //   size: 300,
          //   innerIconsSize: 3,
          //   outerIconsSize: 3,
          //   innerAnimation: Curves.fastOutSlowIn,
          //   outerAnimation: Curves.fastOutSlowIn,
          //   // innerColor: AppColors.orange,
          //   // outerColor: AppColors.orange,
          //   innerAnimationSeconds: 10,
          //   outerAnimationSeconds: 10,
          //   reverse: true,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(100.0),
          //     child: TextButton(
          //       style: ButtonStyle(
          //           overlayColor: MaterialStateProperty.all(
          //               Colors.black.withOpacity(0.1))),
          //       onPressed: () {
          //         // Navigator.push(context,
          //         //     MaterialPageRoute(builder: (context) => ChatScreen()));
          //       },
          //       child: const Text(
          //         "Join",
          //         style: TextStyle(
          //             fontSize: 25,
          //             //color: AppColors.orange
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
