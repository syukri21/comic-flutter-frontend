import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class NewUpdateState extends Equatable {
  NewUpdateState([List props = const []]) : super(props);
}

class InitialNewUpdateState extends NewUpdateState {}

class ChangedNewUpdateSortBy extends NewUpdateState {
  final int value;
  ChangedNewUpdateSortBy(this.value) : super([value]);
}
