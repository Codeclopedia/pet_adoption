import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pet_adoption_app/data/introduction_screen_data.dart';

part 'introduction_screen_event.dart';
part 'introduction_screen_state.dart';

class IntroductionScreenBloc
    extends Bloc<IntroductionScreenEvent, IntroductionScreenState> {
  IntroductionScreenBloc() : super(IntroductionScreenInitial()) {
    on<NextButtonPressedEvent>(nextButtonPressedEvent);
    on<SkipButtonPressedEvent>(skipButtonPressedEvent);
    on<OnPageChangedEvent>(onPageChangeEvent);
  }

  FutureOr<void> nextButtonPressedEvent(
      NextButtonPressedEvent event, Emitter<IntroductionScreenState> emit) {
    emit(NextButtonPressed());
    if (IntroductionScreenData.screenIndex <
        IntroductionScreenData.introductionScreens.length - 1) {
      IntroductionScreenData.screenIndex++;
    } else {
      emit(NavigateToHome());
    }
  }

  FutureOr<void> skipButtonPressedEvent(
      SkipButtonPressedEvent event, Emitter<IntroductionScreenState> emit) {
    emit(SkipButtonPressed());
    if (IntroductionScreenData.screenIndex <
        IntroductionScreenData.introductionScreens.length - 1) {
      IntroductionScreenData.screenIndex =
          IntroductionScreenData.introductionScreens.length - 1;
    }
  }

  FutureOr<void> onPageChangeEvent(
      OnPageChangedEvent event, Emitter<IntroductionScreenState> emit) {
    IntroductionScreenData.screenIndex = event.currentPageIndex;

    emit(OnPageChanged());
  }
}
