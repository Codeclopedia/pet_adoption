part of 'introduction_screen_bloc.dart';

@immutable
sealed class IntroductionScreenState {}

abstract class IntroductionScreenActionState extends IntroductionScreenState {}

final class IntroductionScreenInitial extends IntroductionScreenState {}

class NextButtonPressed extends IntroductionScreenActionState {}

class OnPageChanged extends IntroductionScreenActionState {}

class NavigateToHome extends IntroductionScreenActionState {}

class SkipButtonPressed extends IntroductionScreenActionState {}
