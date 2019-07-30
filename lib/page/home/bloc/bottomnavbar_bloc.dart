import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:comic/page/home/models/bottomnavbar.dart';
import './bloc.dart';

class BottomnavbarBloc extends Bloc<BottomnavbarEvent, BottomnavbarState> {
  @override
  BottomnavbarState get initialState => BottomnavbarInitial();

  @override
  Stream<BottomnavbarState> mapEventToState(
    BottomnavbarEvent event,
  ) async* {
    if (event is Bottomnavbar) {
      yield BottomnavbarLoading();
      final bottomNavbar = await _handleBottomNavbar(event.position);
      yield BottomnavbarLoaded(bottomNavbar);
    }
  }

  Future<Bottomnavbar> _handleBottomNavbar(position) {
    return Future.delayed(Duration(seconds: 1), () {
      return Bottomnavbar(position: position);
    });
  }
}
