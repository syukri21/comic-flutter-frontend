import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:comic/util/dummy.dart' as dummy;

class BannerCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return CarouselSlider(
      aspectRatio: 7 / 4,
      viewportFraction: 0.92,
      enlargeCenterPage: true,
      items: dummy.comics.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, .2),
                      spreadRadius: -10,
                      offset: Offset(0, 20),
                      blurRadius: 10,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(i["image"]),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter)),
            );
          },
        );
      }).toList(),
    );
  }
}
