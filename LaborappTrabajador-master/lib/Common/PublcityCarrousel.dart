import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Util/UtilMethods.dart';
import 'ColorPalette.dart';

class PublicityCarrousel{
  Widget build(BuildContext context){
    return CarouselSlider(
      height: getHeightWithoutSafeArea(context) * 0.2,
      autoPlay: true,
      autoPlayAnimationDuration: Duration(seconds: 1),
      viewportFraction: 0.3,
      enableInfiniteScroll: true,
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.grey),
                child: Center(
                    child: Text(
                      'PUBLICIDAD',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Color(ColorPalette.softGrayApp)),
                    )));
          },
        );
      }).toList(),
    );
  }
}