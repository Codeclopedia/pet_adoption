import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_adoption_app/controller/pet_detail/bloc/pet_detail_bloc.dart';
import 'package:pet_adoption_app/core/themes/text_styles.dart';
import 'package:pet_adoption_app/data/history_data.dart';
import 'package:pet_adoption_app/ui/screens/detail/widgets/confetti.dart';
import 'package:sizer_pro/sizer.dart';

import '../../../core/constants/colors.dart';
import '../../../data/models/pet_data_model.dart';
import 'widgets/custom_header.dart';
import 'widgets/pet_image_container.dart';

class PetDetailScreen extends StatelessWidget {
  final PetDetailModel petDetail;
  const PetDetailScreen({super.key, required this.petDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PetDetailBloc(),
          child: Stack(
            children: [
              ListView(
                padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
                children: [
                  const DetailCustomHeader(),
                  petImageContainer(petDetail: petDetail),
                  Text(
                    "Details",
                    style: headingTextStyle.copyWith(fontSize: 11.sp),
                  ),
                  Text(
                    dummyText + dummyText,
                    style: captionsTextStyle.copyWith(fontSize: 5.sp),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 4.w),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(10.w),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black38,
                                blurRadius: 5.w,
                              ),
                            ]),
                        padding: EdgeInsets.all(2.w),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: AppColors.whiteColor,
                          size: 7.w,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      BlocConsumer<PetDetailBloc, PetDetailState>(
                        listenWhen: (previous, current) =>
                            current is PetDetailLoading,
                        buildWhen: (previous, current) =>
                            current is! PetDetailLoading,
                        listener: (context, state) {},
                        builder: (context, state) {
                          return Expanded(
                            child: InkWell(
                              onTap: HistoryData.adoptedPets.contains(petDetail)
                                  ? null
                                  : () {
                                      context.read<PetDetailBloc>().add(
                                          AdoptMeButtonPressEvent(
                                              petDetail, context));
                                    },
                              child: Container(
                                height: 10.w,
                                decoration: BoxDecoration(
                                    color: HistoryData.adoptedPets
                                            .contains(petDetail)
                                        ? AppColors.backgroundColor
                                        : AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(10.w),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 5.w,
                                      ),
                                    ]),
                                padding: EdgeInsets.all(2.w),
                                alignment: Alignment.center,
                                child: Text(
                                  'Adopt Me',
                                  style: captionsTextStyle.copyWith(
                                      color: HistoryData.adoptedPets
                                              .contains(petDetail)
                                          ? Colors.grey
                                          : AppColors.greenColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<PetDetailBloc, PetDetailState>(
                  builder: (context, state) {
                if (state is PetDetailLoading) {
                  return const Center(
                    child: ConfettiAnimation(),
                  );
                } else if (state is PetDetailLoaded) {
                  return Container();
                }

                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}
