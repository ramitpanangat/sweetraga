import 'package:flutter/material.dart';
import 'package:sweetraga/widgets/customLoading.dart';

class HomeBoxTile extends StatefulWidget {
  final String name;
  final String image;
  final String description;
  HomeBoxTile(
      {@required this.name, @required this.image, @required this.description});
  @override
  _HomeBoxTileState createState() => _HomeBoxTileState();
}

class _HomeBoxTileState extends State<HomeBoxTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.network(widget.image,
                loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CustomLoading(
                size: 30,
              );
            }),
          ),
          Text(widget.name, style: Theme.of(context).textTheme.headline5),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              widget.description,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
