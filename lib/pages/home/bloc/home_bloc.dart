import 'package:easylearning/pages/home/bloc/home_events.dart';
import 'package:easylearning/pages/home/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBlocs extends Bloc<HomeEvents, HomeStates> {
  HomeBlocs() : super(const HomeStates()) {
    on<HomeDots>(_HomeDots);

    on<HomePageCourseItem>((event, emit) {
      emit(state.copyWith(courseItem: event.courseItem));
    });
  }

  void _HomeDots(HomeDots event, Emitter<HomeStates> emit) {
    emit(state.copyWith(index: event.index));
  }
}
