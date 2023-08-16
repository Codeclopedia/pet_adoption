import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pet_adoption_app/data/models/pet_data_model.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../core/themes/text_styles.dart';

Widget petImageContainer({required PetDetailModel petDetail}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 4.w),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.w)),
      child: Column(
        children: [
          Container(
            height: 100.w,
            width: 100.w,
            decoration: BoxDecoration(
                color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                    .withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.w)),
            child: Hero(
                tag: petDetail.id,
                child: CachedNetworkImage(imageUrl: petDetail.imageUrl)),
          ),
          Padding(
            padding:
                EdgeInsets.only(left: 4.w, right: 4.w, top: 2.w, bottom: 6.w),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        petDetail.name,
                        style: headingTextStyle.copyWith(fontSize: 10.sp),
                      ),
                    ),
                    Text(
                      '\$${petDetail.price}',
                      style: captionsTextStyle.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Origin:',
                          style: hintTextStyle.copyWith(fontSize: 5.sp),
                        ),
                        Text(
                          ' ${petDetail.originCountry}',
                          style: captionsTextStyle.copyWith(fontSize: 5.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Height:',
                          style: hintTextStyle.copyWith(fontSize: 5.sp),
                        ),
                        Text(
                          ' ${petDetail.height}',
                          style: captionsTextStyle.copyWith(fontSize: 5.sp),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Female |',
                          style: hintTextStyle.copyWith(fontSize: 5.sp),
                        ),
                        Text(
                          ' ${petDetail.age} year',
                          style: captionsTextStyle.copyWith(fontSize: 5.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Weight:',
                          style: hintTextStyle.copyWith(fontSize: 5.sp),
                        ),
                        Text(
                          ' ${petDetail.weight}',
                          style: captionsTextStyle.copyWith(fontSize: 5.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
