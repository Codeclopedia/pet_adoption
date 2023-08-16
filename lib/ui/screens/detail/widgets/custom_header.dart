import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/themes/text_styles.dart';

class DetailCustomHeader extends StatelessWidget {
  const DetailCustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        Text(
          "Pet Detail",
          style:
              headingTextStyle2.copyWith(color: Colors.black, fontSize: 7.5.sp),
        ),
      ],
    );
  }
}
