import 'package:flutter/material.dart';

class HomeMenuTile extends StatelessWidget {
  final String imgLocate;
  final String name;
  final String locate;
  HomeMenuTile(
      {@required this.imgLocate, @required this.name, @required this.locate});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, locate),
      child: Container(
        width: 150,
        child: Card(
          child: Column(
            children: [
              Expanded(child: Image.asset(imgLocate), flex: 2),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      name,
                      style: Theme.of(context).textTheme.headline2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  flex: 1)
            ],
          ),
        ),
      ),
    );
  }
}
