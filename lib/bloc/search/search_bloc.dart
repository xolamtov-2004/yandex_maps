

import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchTabChanged>(
          (event, emit) => emit(state.copyWith(tabIndex: event.index)),
    );
    on<SearchQueryChanged>(
          (event, emit) => emit(state.copyWith(query: event.query)),
    );
  }
}