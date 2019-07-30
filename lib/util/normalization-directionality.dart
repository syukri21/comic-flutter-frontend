import 'package:flutter/cupertino.dart';

class NormalizationDirectionality extends StatelessWidget {
  final child;

  const NormalizationDirectionality({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      child: this.child,
      textDirection: TextDirection.ltr,
    );
  }
}
