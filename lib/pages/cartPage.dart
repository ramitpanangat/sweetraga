import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sweetraga/widgets/cartTile.dart';

import 'package:sweetraga/dataFiles/cartData.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  double totalAmount = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartData>(
      create: (context) => CartData(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Cart",
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("UserData")
                .doc(_auth.currentUser.uid)
                .collection("Cart")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData || snapshot.data.docs.length == 0) {
                return Center(
                  child: Text("No item added to Cart.",
                      style: TextStyle(color: Colors.grey[400], fontSize: 18)),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: snapshot.data.docs.map((item) {
                          return CartTile(
                            name: item["name"],
                            cost: item["cost"].toDouble(),
                            quantity: item["quantity"],
                            locate: item["locate"],
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 0.5,
                                  color: Theme.of(context).accentColor))),
                      child: Row(children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Total Amount:",
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16)),
                                Consumer<CartData>(
                                  builder: (context, data, child) {
                                    return Text(
                                      "₹ ${data.getTotal}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            child: Text(
                              "Proceed to Pay",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            onPressed: () {},
                            color: Theme.of(context).accentColor,
                            height: 50,
                          ),
                        )
                      ]),
                    )
                  ],
                );
              }
            },
          )),
    );
  }
}
