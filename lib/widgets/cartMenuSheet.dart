import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartSheet extends StatefulWidget {
  final Map item;
  final bool assorted;
  CartSheet({@required this.item, @required this.assorted});
  @override
  _CartSheetState createState() => _CartSheetState();
}

class _CartSheetState extends State<CartSheet> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  int count = 1;
  int countC;
  bool once = false;
  double totalCostC;
  double totalCost = 0.0;
  costAssign(rCost) {
    setState(() {
      totalCost = rCost * count;
    });
  }

  @override
  Widget build(BuildContext context) {
    costAssign(widget.item["price"].toDouble());

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("UserData")
            .doc(_auth.currentUser.uid)
            .collection("Cart")
            .doc(widget.item["name"])
            .snapshots(),
        builder: (context, snapshot) {
          return Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).bottomSheetTheme.backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(208, 171, 107, 1),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: ListTile(
                      title: Text(
                        "Add To Cart",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  snapshot.data != null && snapshot.data.exists
                      ? Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: Text(snapshot.data.get("name"),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              ),
                              Align(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Text("(In Cart)",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.normal,
                                        )),
                                  ),
                                  alignment: Alignment.centerRight),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        )),
                                    IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.minus,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          if (snapshot.data.get("quantity") >
                                              1) {
                                            setState(() {
                                              if (!once) {
                                                countC = snapshot.data
                                                    .get("quantity");
                                                totalCostC = snapshot.data
                                                    .get("cost")
                                                    .toDouble();
                                                once = true;
                                              }
                                            });
                                            FirebaseFirestore.instance
                                                .collection("UserData")
                                                .doc(_auth.currentUser.uid)
                                                .collection("Cart")
                                                .doc(widget.item["name"])
                                                .update({
                                              "quantity": snapshot.data
                                                      .get("quantity") -
                                                  1,
                                              "cost": widget.item["price"] *
                                                  (snapshot.data
                                                          .get("quantity") -
                                                      1)
                                            });
                                          }
                                        }),
                                    Text(
                                      snapshot.data.get("quantity").toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (!once) {
                                              countC =
                                                  snapshot.data.get("quantity");
                                              totalCostC = snapshot.data
                                                  .get("cost")
                                                  .toDouble();
                                              once = true;
                                            }
                                          });
                                          FirebaseFirestore.instance
                                              .collection("UserData")
                                              .doc(_auth.currentUser.uid)
                                              .collection("Cart")
                                              .doc(widget.item["name"])
                                              .update({
                                            "quantity":
                                                snapshot.data.get("quantity") +
                                                    1,
                                            "cost": widget.item["price"] *
                                                (snapshot.data.get("quantity") +
                                                    1)
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 25),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Total Cost",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Text(
                                        "₹ ${snapshot.data.get("cost")}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        )
                      : Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                child: Text(widget.item["name"],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          "Quantity",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        )),
                                    IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.minus,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            if (count > 1) {
                                              count -= 1;
                                            }
                                          });
                                        }),
                                    Text(
                                      count.toString(),
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    IconButton(
                                        icon: FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 12,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            count += 1;
                                          });
                                        })
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 25),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Total Cost",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                      ),
                                      Text(
                                        "₹ $totalCost",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 18),
                                      )
                                    ]),
                              )
                            ],
                          ),
                        ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                color: Theme.of(context).accentColor,
                                width: 0.5))),
                    child: Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              if (snapshot.data != null &&
                                  snapshot.data.exists) {
                                setState(() {
                                  count = snapshot.data.get("quantity");
                                  totalCost =
                                      snapshot.data.get("cost").toDouble();
                                });
                              }
                              FirebaseFirestore.instance
                                  .collection("UserData")
                                  .doc(_auth.currentUser.uid)
                                  .collection("Cart")
                                  .doc(widget.item["name"])
                                  .set({
                                "name": widget.item["name"],
                                "locate": widget.item["locate"],
                                "cost": totalCost,
                                "quantity": count,
                              });
                              Navigator.pop(context);
                            },
                            child: Text("Add",
                                style: TextStyle(color: Colors.white)),
                            color: Color.fromRGBO(208, 171, 107, 1),
                            height: 50,
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            onPressed: () {
                              if (once) {
                                FirebaseFirestore.instance
                                    .collection("UserData")
                                    .doc(_auth.currentUser.uid)
                                    .collection("Cart")
                                    .doc(widget.item["name"])
                                    .update({
                                  "quantity": countC,
                                  "cost": totalCostC.toDouble()
                                });
                              }
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                            height: 50,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
