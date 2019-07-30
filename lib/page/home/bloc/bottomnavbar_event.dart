import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BottomnavbarEvent extends Equatable {
  BottomnavbarEvent([List props = const []]) : super(props);

  get position => null;
}

class GetBottomNavbar extends BottomnavbarEvent {
  final int position;

  GetBottomNavbar(this.position) : super([position]);
}
