import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BottomnavbarEvent extends Equatable {
  BottomnavbarEvent([List props = const []]) : super(props);

  get position => null;
}

class GetBottomNavbar extends BottomnavbarEvent {
  final int position;

  GetBottomNavbar({@required this.position}) : super([position]);
}
