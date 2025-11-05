import 'package:ecommerce/App/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({Key? key}) : super(key: key);
  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularCountDownTimer(
        duration: 30,
        initialDuration: 0,
        controller: _controller,
        width:32,
        height:32,
        ringColor:Colors.transparent,// Colors.grey[300]!,
        ringGradient: null,
        fillColor: AppColors.themeColors,
        fillGradient: null,
        backgroundColor: Colors.white,
        backgroundGradient: null,
        strokeWidth: 6.0,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textFormat: CountdownTextFormat.S,
        isReverse: true,
        isReverseAnimation: true,
        isTimerTextShown: true,
        autoStart: true,
        onStart: () {
          debugPrint('Countdown Started');
        },
        onComplete: () {

        },
      ),
    );
  }
}
