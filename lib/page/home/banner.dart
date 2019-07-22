import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const comics = [
  {
    "id": "cjy9287480gju0743a4m9mbb3",
    "title": "Meng Shi Zai Shang Bahasa Indonesia",
    "image":
        "https://i3.wp.com/kiryuu.co/wp-content/uploads/2019/02/Meng-Shi-Zai-Shang.jpg"
  },
  {
    "id": "cjy9287oa0gkw0743vloceqkb",
    "title": "I’m a Fake NPC Bahasa Indonesia",
    "image":
        "https://i3.wp.com/kiryuu.co/wp-content/uploads/2018/12/Im-a-Fake-NPC.jpg"
  },
  {
    "id": "cjyalbk4u00170720sqf0lfwt",
    "title": "Overlord Bahasa Indonesia",
    "image":
        "https://i1.wp.com/kiryuu.co/wp-content/uploads/2018/09/Overlord.png"
  },
  {
    "id": "cjyalbl9h00380720w9emp1th",
    "title": "I Am The Sorcerer King Bahasa Indonesia",
    "image":
        "https://i2.wp.com/kiryuu.co/wp-content/uploads/2019/06/I-Am-The-Sorcerer-King.jpg"
  }
];

class BannerCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return CarouselSlider(
      aspectRatio: 7.5 / 4,
      viewportFraction: 0.5,
      enlargeCenterPage: true,
      items: comics.map((i) {
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
