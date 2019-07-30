import 'package:comic/page/home/models/bottomnavbar.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BottomnavbarState extends Equatable {
  BottomnavbarState([List props = const []]) : super(props);
}

class BottomnavbarInitial extends BottomnavbarState {}

class BottomnavbarLoading extends BottomnavbarState {}

class BottomnavbarLoaded extends BottomnavbarState {
  final Bottomnavbar bottomNavbar;

  BottomnavbarLoaded(this.bottomNavbar) : super([bottomNavbar]);
}
