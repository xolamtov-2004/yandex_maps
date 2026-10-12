import 'package:flutter_bloc/flutter_bloc.dart';

import 'nav_event.dart';

/// Holat bitta son: hozir ochiq tab indeksi.
class NavBloc extends Bloc<NavEvent, int> {
  NavBloc() : super(0) {
    on<NavTabChanged>((event, emit) => emit(event.index));
  }
}