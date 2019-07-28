// style

import 'package:flutter/cupertino.dart';

DecorationImage decorationImage = DecorationImage(
  image: AssetImage("assets/nav.png"),
  fit: BoxFit.fitWidth,
  alignment: Alignment.center,
);

BoxShadow boxShadow = BoxShadow(
  color: Color.fromRGBO(169, 36, 47, 0.8),
  spreadRadius: -10,
  offset: Offset(0, 9),
  blurRadius: 10,
);

LinearGradient linearGradienRed = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color.fromRGBO(169, 36, 47, 0.4), Color.fromRGBO(169, 36, 47, 0.8)],
);
