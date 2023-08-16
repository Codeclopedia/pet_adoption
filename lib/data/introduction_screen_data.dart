import 'package:flutter/material.dart';

import '../ui/screens/introduction/widgets/introduction_screen_widgets.dart';

class IntroductionScreenData {
  static int screenIndex = 0;

  static final List<Widget> introductionScreens = [
    IntroductionScreenWidgets.screen1,
    IntroductionScreenWidgets.screen2,
    IntroductionScreenWidgets.screen1,
    IntroductionScreenWidgets.screen2
  ];
}
