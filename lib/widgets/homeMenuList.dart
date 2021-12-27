import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sweetraga/widgets/homeMenuTile.dart';

class HomeMenuList extends StatelessWidget {
  final List<Map> item;
  HomeMenuList({@required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
          itemCount: item.length,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return HomeMenuTile(
              imgLocate: item[index]["image"],
              name: item[index]["name"],
              locate: item[index]["locate"],
            );
          }),
    );
  }
}
