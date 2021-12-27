import 'package:flutter/material.dart';

class GridMenu extends StatelessWidget {
  final List<Map> items;
  GridMenu({@required this.items});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: items.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.pushNamed(context, items[index]["locate"]),
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Theme.of(context).accentColor, width: 0.5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Image.asset(items[index]["pngImage"]),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(items[index]["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "₹ ${items[index]["price"]}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
