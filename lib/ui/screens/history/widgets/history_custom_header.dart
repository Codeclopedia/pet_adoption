import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/themes/text_styles.dart';

Widget historyCustomHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(5.w)),
            padding: EdgeInsets.all(2.w),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 6.w,
            )),
      ),
      SizedBox(width: 15.w),
      Text(
        "Adopting History",
        style: headingTextStyle.copyWith(color: Colors.black, fontSize: 10.sp),
      ),
    ],
  );
}
