import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  final double size;
  CustomLoading({@required this.size});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SpinKitRing(
        color: Theme.of(context).accentColor,
        lineWidth: 3,
        size: size,
      ),
    );
  }
}
