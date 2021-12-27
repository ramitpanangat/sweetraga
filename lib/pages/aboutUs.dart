import 'package:flutter/material.dart';
import 'package:sweetraga/dataFiles/companyPolicies.dart';

class Aboutus extends StatefulWidget {
  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          aboutus,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        ),
      )),
    );
  }
}
