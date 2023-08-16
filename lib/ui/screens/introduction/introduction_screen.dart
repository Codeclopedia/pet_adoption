import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer_pro/sizer.dart';

import '../../../controller/introduction/bloc/introduction_screen_bloc.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/routes_list.dart';
import '../../../core/themes/text_styles.dart';
import '../../../data/introduction_screen_data.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocProvider(
        create: (context) => IntroductionScreenBloc(),
        child: BlocConsumer<IntroductionScreenBloc, IntroductionScreenState>(
          buildWhen: (previous, current) =>
              current is IntroductionScreenActionState,
          listenWhen: (previous, current) =>
              current is IntroductionScreenActionState,
          listener: (context, state) {
            if (state is NextButtonPressed) {
              pageController.animateToPage(IntroductionScreenData.screenIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack);
            }
            if (state is SkipButtonPressed) {
              pageController.animateToPage(IntroductionScreenData.screenIndex,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutBack);
            }
            if (state is NavigateToHome) {
              Navigator.pushNamed(context, RouteList.homepage);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount:
                        IntroductionScreenData.introductionScreens.length,
                    controller: pageController,
                    onPageChanged: (value) {
                      context
                          .read<IntroductionScreenBloc>()
                          .add(OnPageChangedEvent(currentPageIndex: value));
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Center(
                            child: IntroductionScreenData
                                .introductionScreens[index]),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IntroductionScreenData.screenIndex ==
                              IntroductionScreenData
                                      .introductionScreens.length -
                                  1
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                context
                                    .read<IntroductionScreenBloc>()
                                    .add(SkipButtonPressedEvent());
                              },
                              child: Text(
                                "Skip",
                                style: subtitlesTextStyle.copyWith(
                                    color: AppColors.greenColor),
                              ),
                            ),
                      customButton(context: context)
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

// Button used for next
  Widget customButton({required BuildContext context}) {
    return InkWell(
      onTap: () {
        context.read<IntroductionScreenBloc>().add(NextButtonPressedEvent());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.w),
            color: AppColors.greenColor),
        padding: EdgeInsets.all(4.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Next",
              style: subtitlesTextStyle.copyWith(color: Colors.white),
            ),
            SizedBox(
              width: 5.w,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(3.w),
              child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: IntroductionScreenData.screenIndex >= 0
                                ? Colors.white
                                : Colors.black12,
                            width: 0.5.w),
                        right: BorderSide(
                            color: IntroductionScreenData.screenIndex >= 1
                                ? Colors.white
                                : Colors.black12,
                            width: 0.5.w),
                        bottom: BorderSide(
                            color: IntroductionScreenData.screenIndex >= 2
                                ? Colors.white
                                : Colors.black12,
                            width: 0.5.w),
                        left: BorderSide(
                            color: IntroductionScreenData.screenIndex >= 3
                                ? Colors.white
                                : Colors.black12,
                            width: 0.5.w)),
                  ),
                  padding: EdgeInsets.all(1.5.w),
                  child: Icon(
                    Icons.keyboard_arrow_right_sharp,
                    color: Colors.white,
                    size: 8.w,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
