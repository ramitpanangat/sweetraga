import 'package:flutter/material.dart';
import 'package:sweetraga/widgets/customLoading.dart';
import 'package:sweetraga/widgets/gridMenu.dart';

class FullMenu extends StatefulWidget {
  final Map items;
  FullMenu({@required this.items});
  @override
  _FullMenuState createState() => _FullMenuState();
}

class _FullMenuState extends State<FullMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.items["title"],
              style: Theme.of(context).textTheme.headline1)),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              widget.items["subtitles"],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).accentColor, width: 0.5)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(widget.items["image"],
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CustomLoading(
                      size: 40,
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      widget.items["name"],
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Text(
                    widget.items["description"],
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  MaterialButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, widget.items["locate"]),
                    child: Text(
                      "View Details",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    color: Theme.of(context).accentColor,
                    elevation: 0,
                    minWidth: MediaQuery.of(context).size.width,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10, top: 15),
            child: Text(
              "INDIVIDUALS",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          GridMenu(items: widget.items["menu"])
        ],
      ),
    );
  }
}
