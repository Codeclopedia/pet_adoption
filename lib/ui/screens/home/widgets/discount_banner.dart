import 'package:flutter/material.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/themes/text_styles.dart';

Widget discountBanner() {
  return Container(
    decoration: BoxDecoration(
        color: AppColors.greenColor, borderRadius: BorderRadius.circular(3.w)),
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 40.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Adopt your favorite pet",
                style: headingTextStyle2,
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                // height: 10.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4.w)),
                child: Text(
                  "10% discount",
                  style: hintTextStyle.copyWith(
                    fontSize: 7.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Image.asset(
            'assets/icons/png/pngwing.com.png',
          ),
        )
      ],
    ),
  );
}
