import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class NewUpdateBloc extends Bloc<NewUpdateEvent, NewUpdateState> {
  @override
  NewUpdateState get initialState => InitialNewUpdateState();

  @override
  Stream<NewUpdateState> mapEventToState(
    NewUpdateEvent event,
  ) async* {
    if (event is OnChangeNewUpdateSortBy) {
      yield ChangedNewUpdateSortBy(event.value);
    }
  }
}
