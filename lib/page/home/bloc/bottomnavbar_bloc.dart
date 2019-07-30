import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comic/page/home/models/bottomnavbar.dart';
import './bloc.dart';

class BottomnavbarBloc extends Bloc<BottomnavbarEvent, BottomnavbarState> {
  @override
  BottomnavbarState get initialState => BottomnavbarChanged(1);

  @override
  Stream<BottomnavbarState> mapEventToState(
    BottomnavbarEvent event,
  ) async* {
    if (event is GetBottomNavbar) {
      yield BottomnavbarChanged(event.position);
    }
  }
}
