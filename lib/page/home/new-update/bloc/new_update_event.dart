import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewUpdateEvent extends Equatable {
  NewUpdateEvent([List props = const []]) : super(props);
}

class OnChangeNewUpdateSortBy extends NewUpdateEvent {
  final int value;
  OnChangeNewUpdateSortBy(this.value) : super([value]);
}
