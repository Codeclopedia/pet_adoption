import 'package:flutter/material.dart';

import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/assets_widgets.dart';

class IntroductionScreenWidgets {
  IntroductionScreenWidgets._();

  static final Widget screen1 = Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      getlottie('animation_ll25ybxp.json'),
      Text(
        'Make a New Friend!',
        style: headingTextStyle,
      ),
      Text(
        dummyText + dummyText,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: captionsTextStyle,
      )
    ],
  );

  static final Widget screen2 = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      getlottie('animation_ll263z3s.json'),
      Text(
        'It\'s So Easy!',
        style: headingTextStyle,
      ),
      Text(
        dummyText,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: captionsTextStyle,
      )
    ],
  );
}
