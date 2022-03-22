import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:outnet/app_res/AppColors.dart';

class SpinWidget extends StatefulWidget {
  final bool isVisibleSpin;

  const SpinWidget({Key? key, required this.isVisibleSpin}) : super(key: key);

  @override
  _SpinWidgetState createState() => _SpinWidgetState();
}

class _SpinWidgetState extends State<SpinWidget> {
  @override
  Widget build(BuildContext context) {
    return TickerMode(
      enabled: widget.isVisibleSpin,
      child: Visibility(
        visible: widget.isVisibleSpin,
        child: Container(
          color: Colors.black,
          child: const SpinKitDoubleBounce(
            color: AppColors.orange,
            size: 50.0,
          ),
        ),
      ),
    );
  }
}
