import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sweetraga/widgets/favouriteListTile.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("UserData")
            .doc(_auth.currentUser.uid)
            .collection("Favourites")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData || snapshot.data.docs.length == 0) {
            return Center(
              child: Text(
                "No Favourites added.",
                style: TextStyle(color: Colors.grey[400], fontSize: 18),
              ),
            );
          } else {
            return ListView(
                children: snapshot.data.docs
                    .map((doc) => FavouriteTile(
                          image: doc["image"],
                          name: doc["name"],
                          price: doc["price"],
                          locate: doc["locate"],
                          assorted: doc["assorted"],
                        ))
                    .toList());
          }
        },
      ),
    );
  }
}
