import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

LottieBuilder getlottie(String name) =>
    Lottie.asset('assets/icons/lottie/$name');

Widget getSvg(String svgPath) => SvgPicture.asset(
      "assets/icons/svg/$svgPath",
    );
