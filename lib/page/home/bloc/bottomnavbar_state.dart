import 'package:comic/page/home/models/bottomnavbar.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BottomnavbarState extends Equatable {
  BottomnavbarState([List props = const []]) : super(props);
}

class BottomnavbarChanged extends BottomnavbarState {
  final int position;
  BottomnavbarChanged(this.position) : super([position]);
}

class BottomnavbarLoaded extends BottomnavbarState {
  final Bottomnavbar bottomNavbar;

  BottomnavbarLoaded(this.bottomNavbar) : super([bottomNavbar]);
}
