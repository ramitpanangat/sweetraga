import 'package:flutter/material.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  Widget aboutTile(String title, String locate) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline4),
      onTap: () => Navigator.pushNamed(context, locate),
    );
  }

  Widget divider() {
    return Divider(
      color: Colors.grey,
      height: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Company",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          aboutTile("Cancellation & Refund", "/cancellation"),
          divider(),
          aboutTile("Terms & Conditions", "/terms"),
          divider(),
          aboutTile("Shipping & Delivery", "/shipping"),
          divider(),
          aboutTile("Privacy", "/privacy"),
          divider()
        ],
      ),
    );
  }
}
