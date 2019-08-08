import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AllblocEvent extends Equatable {
  AllblocEvent([List props = const []]) : super(props);
}

class SortAllBy extends AllblocEvent {
  final int value;
  SortAllBy(this.value) : super([value]);
}
