part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent {}

class HistoryButtonTapEvent extends HomepageEvent {}

class SearchTypingEvent extends HomepageEvent {
  final String text;
  SearchTypingEvent(this.text);
}

class ListScrollEvent extends HomepageEvent {}

class ListItemTapEvent extends HomepageEvent {}
