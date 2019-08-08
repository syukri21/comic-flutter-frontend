import 'package:flutter/widgets.dart';

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
