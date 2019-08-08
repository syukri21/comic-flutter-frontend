import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AllblocState extends Equatable {
  AllblocState([List props = const []]) : super(props);
}

class InitialAllblocState extends AllblocState {}

class ChangedSortAllBy extends AllblocState {
  final int value;
  ChangedSortAllBy(this.value) : super([value]);
}
