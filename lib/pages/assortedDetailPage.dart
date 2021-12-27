import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sweetraga/widgets/carouselGallery.dart';
import 'package:sweetraga/widgets/cartMenuSheet.dart';
import 'package:sweetraga/widgets/customLoading.dart';

class AssortedDetailPage extends StatefulWidget {
  final Map items;
  final List listItems;
  final List gallery;
  AssortedDetailPage(
      {@required this.items, @required this.listItems, @required this.gallery});
  @override
  _AssortedDetailPageState createState() => _AssortedDetailPageState();
}

class _AssortedDetailPageState extends State<AssortedDetailPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  void openbottom() {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        backgroundColor: Colors.black54.withAlpha(1),
        builder: (context) {
          return Container(
            child: CartSheet(
              item: widget.items,
              assorted: true,
            ),
          );
        },
        elevation: 30);
  }

  Widget title(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 5),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("UserData")
            .doc(_auth.currentUser.uid)
            .collection("Favourites")
            .doc(widget.items["name"])
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Product Details",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: ListView(
                    children: [
                      Image.network(
                        widget.items["image"],
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return CustomLoading(
                            size: 40,
                          );
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          widget.items["name"],
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
                        child: Text(
                          "₹ ${widget.items["price"]}",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      title("Description"),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 10, left: 15, right: 10),
                        child: Text(widget.items["description"],
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Sweets available in Box",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: widget.listItems
                              .map((item) => Text(
                                    item["name"],
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ))
                              .toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 10),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.truck,
                                color: Colors.grey, size: 16),
                            SizedBox(width: 5),
                            Text("Standard shipping in 3 working days.",
                                style: Theme.of(context).textTheme.headline4)
                          ],
                        ),
                      ),
                      title("Packaging"),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                        child: Text(
                          "Hand Crafted premium wooden box packaging.",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      title("Gallery"),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Tap the image to view.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      GalleryCarousel(images: widget.gallery)
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 0.5,
                                color: Theme.of(context).accentColor))),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextButton.icon(
                            onPressed: () {
                              openbottom();
                            },
                            label: Text(
                              "Add To Cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.white,
                            ),
                            style: TextButton.styleFrom(
                                minimumSize: Size.fromHeight(50),
                                elevation: 0,
                                backgroundColor: Theme.of(context).accentColor),
                          ),
                        ),
                        snapshot.data != null && snapshot.data.exists
                            ? Expanded(
                                child: TextButton.icon(
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection("UserData")
                                        .doc(_auth.currentUser.uid)
                                        .collection("Favourites")
                                        .doc(widget.items["name"])
                                        .delete();
                                  },
                                  label: Text(
                                    "Unfavourite Item",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).accentColor),
                                  ),
                                  icon: Icon(
                                    Icons.star,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  style: TextButton.styleFrom(
                                      minimumSize: Size.fromHeight(50),
                                      elevation: 0),
                                ),
                              )
                            : Expanded(
                                child: TextButton.icon(
                                onPressed: () {
                                  FirebaseFirestore.instance
                                      .collection("UserData")
                                      .doc(_auth.currentUser.uid)
                                      .collection("Favourites")
                                      .doc(widget.items["name"])
                                      .set({
                                    "name": widget.items["name"],
                                    "image": widget.items["image"],
                                    "price": widget.items["price"],
                                    "locate": widget.items["locate"],
                                    "assorted": true
                                  });
                                },
                                label: Text(
                                  "Favourite Item",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).accentColor),
                                ),
                                icon: Icon(
                                  Icons.star_border,
                                  color: Theme.of(context).accentColor,
                                ),
                                style: TextButton.styleFrom(
                                    minimumSize: Size.fromHeight(50),
                                    elevation: 0),
                              )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
