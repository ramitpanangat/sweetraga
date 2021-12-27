import 'package:flutter/material.dart';

class PolicyPage extends StatefulWidget {
  final String title;
  final String content;
  PolicyPage({@required this.title, @required this.content});
  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              widget.content,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            )),
      ),
    );
  }
}
