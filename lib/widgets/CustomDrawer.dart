import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sweetraga/dataFiles/appStateNotifier.dart';

class CustomDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Widget drawerMenu(
      String option, IconData icon, BuildContext context, String locate) {
    return ListTile(
      leading: FaIcon(
        icon,
        color: Colors.grey[500],
        size: 20,
      ),
      title: Text(
        option,
        style: TextStyle(fontSize: 20, color: Colors.grey[500]),
      ),
      onTap: () {
        Navigator.pushNamed(context, locate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset("assets/logo_small.png"),
          )),
          drawerMenu(
              "Favourites", FontAwesomeIcons.solidStar, context, "/favourite"),
          drawerMenu(
              "My Cart", FontAwesomeIcons.shoppingCart, context, "/cart"),
          drawerMenu(
              "Contacts", FontAwesomeIcons.phoneAlt, context, "/contacts"),
          drawerMenu(
              "Company", FontAwesomeIcons.userFriends, context, "/company"),
          drawerMenu(
              "About Us", FontAwesomeIcons.infoCircle, context, "/aboutus"),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.solidMoon,
                color: Colors.grey[500], size: 20),
            title: Text(
              "Dark Mode",
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
            trailing: Switch(
                activeColor: Color.fromRGBO(208, 171, 107, 1),
                value: Provider.of<AppStateNotifer>(context, listen: false)
                    .isdarkModeOn,
                onChanged: (val) {
                  Provider.of<AppStateNotifer>(context, listen: false)
                      .updateMode(val);
                }),
          ),
          Divider(
            color: Colors.grey[400],
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.signOutAlt,
                color: Colors.grey[500], size: 20),
            title: Text(
              "Sign Out",
              style: TextStyle(fontSize: 20, color: Colors.grey[500]),
            ),
            onTap: () {
              _auth.signOut();
            },
          )
        ],
      ),
    ));
  }
}
