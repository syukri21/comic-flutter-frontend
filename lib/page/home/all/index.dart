import 'package:comic/page/home/all/all-appbar.dart';
import 'package:comic/page/home/all/all-body.dart';
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
      body: AllBody(),
    );
  }
}
