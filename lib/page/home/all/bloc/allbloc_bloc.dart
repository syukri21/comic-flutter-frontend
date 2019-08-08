import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AllblocBloc extends Bloc<AllblocEvent, AllblocState> {
  @override
  AllblocState get initialState => InitialAllblocState();

  @override
  Stream<AllblocState> mapEventToState(
    AllblocEvent event,
  ) async* {
    if (event is SortAllBy) {
      yield ChangedSortAllBy(event.value);
    }
  }
}
