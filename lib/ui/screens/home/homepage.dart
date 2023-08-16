import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/controller/homepage/bloc/homepage_bloc.dart';

import 'package:sizer_pro/sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../core/themes/text_styles.dart';
import 'widgets/custom_homepage_header.dart';
import 'widgets/discount_banner.dart';
import 'widgets/pets_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.w),
          child: BlocProvider(
            create: (context) => HomepageBloc(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeader(),
                SizedBox(
                  height: 2.h,
                ),
                discountBanner(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.w),
                  child: Text(
                    'Recommended',
                    style:
                        captionsTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const PetsListView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
