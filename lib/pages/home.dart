import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sweetraga/dataFiles/appStateNotifier.dart';
import 'package:sweetraga/dataFiles/productInfo.dart';
import 'package:sweetraga/widgets/CustomDrawer.dart';
import 'package:sweetraga/widgets/carouselTile.dart';
import 'package:sweetraga/widgets/homeBoxTiles.dart';
import 'package:sweetraga/widgets/homeMenuList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin;

  checkAuthentification() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.of(context).pushReplacementNamed("/login");
      }
    });
  }

  getUser() async {
    User firebaseUser = _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = _auth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentification();
    this.getUser();
  }

  Widget listTile(String title, String locate) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.headline3),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: Text("See More",
                style: TextStyle(
                    color: Theme.of(context).accentColor, fontSize: 16)),
          ),
          FaIcon(
            FontAwesomeIcons.angleDoubleRight,
            color: Theme.of(context).accentColor,
            size: 16,
          )
        ],
      ),
      onTap: () => Navigator.pushNamed(context, locate),
    );
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AppStateNotifer>(context).checkPref();
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo_small.png",
          width: 120,
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                size: 30,
              ),
              onPressed: () => Navigator.pushNamed(context, "/cart"))
        ],
      ),
      drawer: CustomDrawer(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, "/contacts"),
          child: FaIcon(FontAwesomeIcons.phoneAlt, color: Colors.white)),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ListTile(
            title: Text("Assorted Boxes",
                style: Theme.of(context).textTheme.headline3),
          ),
          CarouselSlider(
              items: assorted
                  .map((item) => CarouselTile(
                      name: item["name"],
                      image: item["image"],
                      description: item["description"],
                      locate: item["locate"]))
                  .toList(),
              options: CarouselOptions(
                  height: 220,
                  autoPlay: true,
                  autoPlayCurve: Curves.decelerate,
                  enlargeCenterPage: true)),
          listTile("Ladoos", "/ladoos"),
          HomeMenuList(item: ladoos),
          listTile("S-Cubes", "/scubes"),
          HomeMenuList(item: scubes),
          listTile("Chocolates", "/chocolates"),
          HomeMenuList(item: chocolates),
          ListTile(
            title: Text("Packaging Options",
                style: Theme.of(context).textTheme.headline3),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              children: boxes
                  .map((box) => Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Theme.of(context).accentColor)),
                          child: HomeBoxTile(
                              name: box["name"],
                              image: box["image"],
                              description: box["description"]),
                        ),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
