import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pet_adoption_app/controller/homepage/bloc/homepage_bloc.dart';
import 'package:pet_adoption_app/data/home_page_data.dart';
import 'package:pet_adoption_app/data/models/pet_data_model.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/routes_list.dart';
import '../../../../core/themes/text_styles.dart';

class PetsListView extends StatefulWidget {
  const PetsListView({super.key});

  @override
  State<PetsListView> createState() => _PetsListViewState();
}

class _PetsListViewState extends State<PetsListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    context.read<HomepageBloc>().add(ListScrollEvent());

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<HomepageBloc>().add(ListScrollEvent());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<HomepageBloc, HomepageState>(
        listener: (context, state) {},
        listenWhen: (previous, current) => current is HomepageLoadingState,
        buildWhen: (previous, current) => current is HomepageLoadedState,
        builder: (context, state) {
          return AnimationLimiter(
            child: ListView.builder(
              itemCount: HomepageData.petsList.length,
              shrinkWrap: true,
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return listCondition(index)
                    ? AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(seconds: 1),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: listViewTile(
                                context: context,
                                petDetails: HomepageData.petsList[index]),
                          ),
                        ),
                      )
                    : Container();
              },
            ),
          );
        },
      ),
    );
  }

  bool listCondition(int index) {
    return HomepageData.petsList[index].breed
            .contains(HomepageData.searchTerm.toLowerCase().trim()) ||
        HomepageData.petsList[index].name
            .contains(HomepageData.searchTerm.toLowerCase().trim()) ||
        HomepageData.petsList[index].species
            .contains(HomepageData.searchTerm.toLowerCase().trim());
  }

  Widget listViewTile(
      {required BuildContext context, required PetDetailModel petDetails}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.w),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, RouteList.detailpage,
              arguments: petDetails);
        },
        child: Container(
          height: 35.w,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(3.w)),
          padding: EdgeInsets.all(2.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: 30.w,
              height: 30.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(0.4)),
              child: Hero(
                  tag: petDetails.id,
                  child: CachedNetworkImage(imageUrl: petDetails.imageUrl)),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petDetails.name,
                      style: subtitlesTextStyle,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          size: 5.w,
                          color: Colors.grey,
                        ),
                        Text(
                          " ${petDetails.location}",
                          style: hintTextStyle.copyWith(fontSize: 4.sp),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Origin:",
                          style: captionsTextStyle.copyWith(
                              fontSize: 4.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${petDetails.originCountry}",
                          maxLines: 2,
                          style: hintTextStyle.copyWith(fontSize: 4.sp),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "MALE | ",
                          style: captionsTextStyle.copyWith(
                              fontSize: 4.sp, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " ${petDetails.age} YEARS",
                          maxLines: 2,
                          style: captionsTextStyle.copyWith(
                              fontSize: 4.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 1.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    child: Icon(
                      Icons.favorite_border_rounded,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "\$${petDetails.price}",
                    style: captionsTextStyle.copyWith(
                        color: AppColors.greenColor,
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
