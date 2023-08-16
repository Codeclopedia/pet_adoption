import 'dart:async';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:pet_adoption_app/data/history_data.dart';
import 'package:pet_adoption_app/data/models/pet_data_model.dart';
import 'package:sizer_pro/sizer.dart';

part 'pet_detail_event.dart';
part 'pet_detail_state.dart';

class PetDetailBloc extends Bloc<PetDetailEvent, PetDetailState> {
  PetDetailBloc() : super(PetDetailInitial()) {
    on<AdoptMeButtonPressEvent>(adoptMeButtonPressEvent);
  }

  FutureOr<void> adoptMeButtonPressEvent(
      AdoptMeButtonPressEvent event, Emitter<PetDetailState> emit) async {
    emit(PetDetailLoading());
    HistoryData.adoptedPets.add(event.petDetail);
    final snackBar = SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,

      content: AwesomeSnackbarContent(
        title: 'Pet Adopted!',
        message: 'YAAY! This pet has been adopted',
        contentType: ContentType.success,
      ),
      margin: EdgeInsets.only(
        bottom: 80.h,
      ),
    );

    ScaffoldMessenger.of(event.buildContext)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
    await Future.delayed(const Duration(seconds: 2));
    emit(PetDetailLoaded());
  }
}
