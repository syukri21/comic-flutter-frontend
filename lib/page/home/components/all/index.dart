import 'package:comic/page/home/components/all/components/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class All extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AllAppbar(),
        preferredSize: const Size(null, 30),
      ),
    );
  }
}
