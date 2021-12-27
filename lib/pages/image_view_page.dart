import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:sweetraga/widgets/customLoading.dart';

class ImageSee extends StatefulWidget {
  final String image;
  ImageSee({@required this.image});
  @override
  _ImageSeeState createState() => _ImageSeeState();
}

class _ImageSeeState extends State<ImageSee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(widget.image),
          loadingBuilder: (context, loadingProgress) => CustomLoading(size: 15),
        ),
      ),
    );
  }
}
