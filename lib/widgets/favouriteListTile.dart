import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavouriteTile extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String locate;
  final bool assorted;
  FavouriteTile(
      {@required this.image,
      @required this.name,
      @required this.price,
      @required this.locate,
      @required this.assorted});
  @override
  _FavouriteTileState createState() => _FavouriteTileState();
}

class _FavouriteTileState extends State<FavouriteTile> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  ImageProvider<Object> imageGet(url) {
    if (!widget.assorted) {
      return AssetImage(url);
    } else {
      return NetworkImage(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(width: 0.5, color: Theme.of(context).accentColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageGet(widget.image), fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.name,
                            style: Theme.of(context).textTheme.headline1),
                        Text("₹ ${widget.price}",
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Divider(
                color: Theme.of(context).accentColor,
              ),
            ),
            Container(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, widget.locate);
                      },
                      child: Text(
                        "View Details",
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("UserData")
                            .doc(_auth.currentUser.uid)
                            .collection("Favourites")
                            .doc(widget.name)
                            .delete();
                      },
                      child: Text(
                        "Unfavourite Item",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
