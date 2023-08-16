import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/controller/homepage/bloc/homepage_bloc.dart';
import 'package:pet_adoption_app/core/constants/routes_list.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/utils/assets_widgets.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomepageBloc, HomepageState>(
      listenWhen: (previous, current) => current is HomepageLoadingState,
      buildWhen: (previous, current) => current is HomepageLoadedState,
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(1.w)),
                padding: EdgeInsets.all(1.w),
                child: getSvg('menu-svgrepo-com.svg'),
              ),
            ),
            Expanded(
              child: Container(
                height: 4.5.h,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(1.w)),
                // padding: EdgeInsets.all(1.w),

                child: TextFormField(
                  onChanged: (value) {
                    context.read<HomepageBloc>().add(SearchTypingEvent(value));
                  },
                  textAlign: TextAlign.start,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(0),
                      hintText: 'Search pet...',
                      alignLabelWithHint: true,
                      prefixIcon: Icon(Icons.search)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.w),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteList.historypage);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(1.w)),
                  padding: EdgeInsets.all(1.w),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: CircleAvatar(
                          backgroundColor: AppColors.greenColor,
                          radius: 1.w,
                        ),
                      ),
                      Icon(
                        Icons.history,
                        size: 10.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
