import 'package:flutter/material.dart';

class CarouselTile extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  final String locate;
  CarouselTile(
      {@required this.name,
      @required this.image,
      @required this.description,
      @required this.locate});
  @override
  _CarouselTileState createState() => _CarouselTileState();
}

class _CarouselTileState extends State<CarouselTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, widget.locate),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                image: NetworkImage(widget.image), fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black45),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                widget.name.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    "VIEW DETAILS",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
