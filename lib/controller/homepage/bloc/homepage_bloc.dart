import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pet_adoption_app/data/home_page_data.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomepageBloc extends Bloc<HomepageEvent, HomepageState> {
  HomepageBloc() : super(HomepageInitial()) {
    on<HistoryButtonTapEvent>(historybuttontapEvent);
    on<SearchTypingEvent>(searchTypingEvent);
    on<ListScrollEvent>(listScrollEvent);
    on<ListItemTapEvent>(listItemTapEvent);
  }

  FutureOr<void> historybuttontapEvent(
      HistoryButtonTapEvent event, Emitter<HomepageState> emit) {
    emit(HistoryButtonTapState());
  }

  FutureOr<void> searchTypingEvent(
      SearchTypingEvent event, Emitter<HomepageState> emit) {
    emit(HomepageLoadingState());
    HomepageData.searchTerm = event.text;
    emit(HomepageLoadedState());
  }

  FutureOr<void> listScrollEvent(
      ListScrollEvent event, Emitter<HomepageState> emit) async {
    HomepageData.isLoading = true;
    emit(HomepageLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    if (HomepageData.petsList.isEmpty) {
      HomepageData.lastIndex = 0;
    }
    int currentlastIndex = HomepageData.lastIndex;
    for (HomepageData.lastIndex;
        HomepageData.lastIndex < currentlastIndex + 5;
        HomepageData.lastIndex++) {
      HomepageData.petsList
          .add(HomepageData.petDetailsDatabase[HomepageData.lastIndex]);
    }
    HomepageData.isLoading = false;
    emit(HomepageLoadedState());
  }

  FutureOr<void> listItemTapEvent(
      ListItemTapEvent event, Emitter<HomepageState> emit) {
    emit(ListItemTapState());
  }
}
