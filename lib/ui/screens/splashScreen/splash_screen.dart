import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pet_adoption_app/core/constants/routes_list.dart';
import 'package:sizer_pro/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationController.forward();
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        Navigator.pushNamed(context, RouteList.introductionScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Lottie.asset('assets/icons/lottie/logo_gif.json',
            height: 30.h, controller: _animationController, repeat: false),
      ),
    );
  }
}
