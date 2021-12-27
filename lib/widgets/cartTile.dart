import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sweetraga/dataFiles/cartData.dart';

class CartTile extends StatefulWidget {
  final String name;
  final double cost;
  final int quantity;
  final String locate;
  CartTile(
      {@required this.name,
      @required this.cost,
      @required this.quantity,
      @required this.locate});
  @override
  _CartTileState createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Widget text(data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(data,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                widget.name,
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 20),
              ),
            ),
            Row(
              children: [
                Expanded(child: text("Quantity")),
                text(widget.quantity.toString())
              ],
            ),
            Row(
              children: [
                Expanded(child: text("Total Cost")),
                text("₹ ${widget.cost}")
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
                    onPressed: () =>
                        Navigator.pushNamed(context, widget.locate),
                    child: Text(
                      "View Details",
                      style: TextStyle(
                          color: Theme.of(context).accentColor, fontSize: 16),
                    ),
                  )),
                  Expanded(
                    child: TextButton(
                      child: Text(
                        "Delete",
                        style: TextStyle(color: Colors.red, fontSize: 16),
                      ),
                      onPressed: () {
                        FirebaseFirestore.instance
                            .collection("UserData")
                            .doc(_auth.currentUser.uid)
                            .collection("Cart")
                            .doc(widget.name)
                            .delete();
                        Provider.of<CartData>(context, listen: false)
                            .decrementAmount(widget.cost);
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
