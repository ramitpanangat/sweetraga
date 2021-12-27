import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CartData extends ChangeNotifier {
  double totalAmount = 0;
  int index = 0;
  FirebaseAuth _auth = FirebaseAuth.instance;

  double get getTotal {
    FirebaseFirestore.instance
        .collection("UserData")
        .doc(_auth.currentUser.uid)
        .collection("Cart")
        .snapshots()
        .forEach((element) {
      while (this.index < element.docs.length) {
        this.totalAmount += element.docs[index]["cost"].toDouble();
        this.index++;
      }
    });
    return totalAmount;
  }

  updateAmount(amount) {
    this.totalAmount = amount.toDouble();
    notifyListeners();
  }

  decrementAmount(amount) {
    this.totalAmount -= amount.toDouble();
    notifyListeners();
  }
}
