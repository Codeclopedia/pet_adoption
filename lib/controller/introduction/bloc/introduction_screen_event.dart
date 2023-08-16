part of 'introduction_screen_bloc.dart';

@immutable
sealed class IntroductionScreenEvent {}

class NextButtonPressedEvent extends IntroductionScreenEvent {}

class OnPageChangedEvent extends IntroductionScreenEvent {
  final int currentPageIndex;
  OnPageChangedEvent({required this.currentPageIndex});
}

class SkipButtonPressedEvent extends IntroductionScreenEvent {}
