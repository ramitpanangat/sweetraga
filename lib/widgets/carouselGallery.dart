import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sweetraga/pages/image_view_page.dart';

class GalleryCarousel extends StatefulWidget {
  final List images;
  GalleryCarousel({this.images});
  @override
  _GalleryCarouselState createState() => _GalleryCarouselState();
}

class _GalleryCarouselState extends State<GalleryCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: CarouselSlider(
          items: widget.images
              .map((image) => InkWell(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ImageSee(image: image))),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 1),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image))),
                    ),
                  ))
              .toList(),
          options: CarouselOptions(
              height: 200, autoPlay: true, enlargeCenterPage: true)),
    );
  }
}
