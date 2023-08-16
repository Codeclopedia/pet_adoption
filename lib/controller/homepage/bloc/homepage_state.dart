part of 'homepage_bloc.dart';

@immutable
sealed class HomepageState {}

abstract class HomepageActionState extends HomepageState {}

final class HomepageInitial extends HomepageState {}

final class HomepageLoadingState extends HomepageState {}

final class HomepageLoadedState extends HomepageState {}

final class HistoryButtonTapState extends HomepageActionState {}

final class ListItemTapState extends HomepageActionState {}

final class SearchButtonTypingState extends HomepageActionState {}
